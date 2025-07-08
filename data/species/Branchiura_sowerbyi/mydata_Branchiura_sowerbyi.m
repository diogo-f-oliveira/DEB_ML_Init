function [data, auxData, metaData, txtData, weights] = mydata_Branchiura_sowerbyi

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Naididae';
metaData.species    = 'Branchiura_sowerbyi'; 
metaData.species_en = 'Tubificid worm'; 

metaData.ecoCode.climate = {'C'};
metaData.ecoCode.ecozone = {'TP', 'TN', 'TA', 'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 05 19];              
metaData.email    = 'bas.kooijman@vu.nl';            
metaData.address  = 'VU university Amsterdam'; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = 'sta@akvaplan.niva.no'; 
metaData.date_acc    = [2022 05 19]; 

%% set data
% zero-variate data

data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DucrPery2007';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DucrPery2007';
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1100;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'DucrPery2007';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.44e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DucrPery2007';
data.Wwp = 84e-3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'DucrPery2007';
data.Wwi = 240e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DucrPery2007';

data.Ri  = 2.2*4/30;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DucrPery2007';
temp.Ri = C2K(21);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '2.2 eggs per cocoon, about 4 coccons per ind in 30 d';


% time-weight
data.tWw = [ ... % time since birth (d), wet weight (mg)
0.388	0.001
9.716	1.257
20.974	13.076
30.656	40.420
41.512	62.797
50.852	54.116
72.190	86.448
83.062	96.402
122.299	115.097
152.967	147.442
182.092	169.848
214.713	194.743
246.187	204.730
278.033	227.140
325.061	233.424
354.992	234.092
377.534	237.232];
data.tWw(:,2) = data.tWw(:,2)/1000; % convert mg to g
units.tWw   = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw    = C2K(21);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DucrPery2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 15 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'We assume kap_R 0.95/2 for consistency with how all hermaphrodites are treated in the collection';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Branchiura_sowerbyi is hermaphroditic. However, two worms are still required for reproduction.';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'N6WK'; % Cat of Life
metaData.links.id_ITIS = '68621'; % ITIS
metaData.links.id_EoL = '51614404'; % Ency of Life
metaData.links.id_Wiki = 'Branchiura'; % Wikipedia
metaData.links.id_ADW = 'Branchiura_sowerbyi'; % ADW
metaData.links.id_Taxo = '15530'; % Taxonomicon
metaData.links.id_WoRMS = '182695'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Branchiura}}';
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
bibkey = 'DucrPery2007'; type = 'Article'; bib = [ ... 
'author = {Ducrot, V. and P\''{e}ry, A. R. R. and Qu\''{e}au, H. and Mons, R. and Lafont, M. and Garric, J.}, ' ... 
'year = {2007}, ' ...
'title = {Rearing and estimation of life-cycle parameters of the tubicifid worm \emph{Branchiura sowerbyi}: Application to ecotoxicity testing.}, ' ...
'journal = {Sci. Tot. Environ.}, ' ...
'volume = {384}, ' ...
'pages = {252-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
