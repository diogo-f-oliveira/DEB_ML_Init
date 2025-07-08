function [data, auxData, metaData, txtData, weights] = mydata_Dendrobaena_octaedra

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Dendrobaena_octaedra'; 
metaData.species_en = 'Earth worm'; 

metaData.ecoCode.climate = {'C'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2009 07 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 07]; 

%% set data
% zero-variate data

data.ab = 92;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BindBayl2007';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BindBayl2007';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BindBayl2007';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.4;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'BindBayl2007';
data.Lp  = 5.2;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BindBayl2007';
data.Li  = 7;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BindBayl2007';

data.Wwb = 2.87e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BindBayl2007';
data.Wwp = 159e-3;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'BindBayl2007';
data.Wwi = 386e-3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'BindBayl2007';

data.Ri  = 0.777;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'HolmOste1991';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight^(1/3) (g^(1/3))
13.75	0.576
27.75	0.895
41.77	1.100
55.81	1.173
69.85	1.258
83.89	1.339
97.93	1.418
111.77	1.479
139.68	1.440];
data.tW(:,2) = data.tW(:,2).^3; % remove transformation
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Kooy1993';
comment.tW = 'Data from Hans Bos for D. veneta, pers comm, see Fig 4.26 of Kooy1993';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Growth data are for D. veneta and assumed to differ by {p_Am} only, via large f_tL';
D2 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '34M74'; % Cat of Life
metaData.links.id_ITIS = '975999'; % ITIS
metaData.links.id_EoL = '3126867'; % Ency of Life
metaData.links.id_Wiki = 'Dendrobaena'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2907467'; % Taxonomicon
metaData.links.id_WoRMS = '1041023'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrobaena_octaedra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy1993'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {1993}, ' ...
'title  = {Dynamic Energy Budgets in biological systems}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Fig 4.26, page 157}, ' ...
'howpublished = {\url{../../../bib/Kooy1993.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BindBayl2007'; type = 'Article'; bib = [ ... 
'author = {Bindesb{\o}l, A. M. and Bayley, M. and Damgaard, C. and Holmstrup, M.}, ' ... 
'year = {2007}, ' ...
'title = {Life-history traits and population growth rate in the laboratory of the earthworm \emph{Dendrobaena octaedra} cultured in copper-contaminated soil}, ' ...
'journal = {Applied Soil Ecology}, ' ...
'volume = {35}, ' ...
'pages = {46--56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HolmOste1991'; type = 'Article'; bib = [ ... 
'author = {Holmstrup, M. and {\O}stergaard, I. K. and Nielsen, A. and Hansen, B. T.}, ' ... 
'year = {1991}, ' ...
'title = {The relationship between temperature and cocoon incubation time for some Lumbricid earthworm species}, ' ...
'journal = {Pedobiologia}, ' ...
'volume = {35}, ' ...
'pages = {179--184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

