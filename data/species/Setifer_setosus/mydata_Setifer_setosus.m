function [data, auxData, metaData, txtData, weights] = mydata_Setifer_setosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Afrosoricida'; 
metaData.family     = 'Tenrecidae';
metaData.species    = 'Setifer_setosus'; 
metaData.species_en = 'Greater hedgehog tenrec'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCiw'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 12 17]; 

%% set data
% zero-variate data

data.tg = 54;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(32.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 58 d';
data.tx = 24;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(32.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 198;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(32.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.1*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(32.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 24.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 62.5; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'guess';
  comment.Wwx = 'based on same relative weight, compared to Echinops_telfairi: 50 * 225/180';
data.Wwi = 225;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(32.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

  % univariate data

% time-weight
data.tWw = [ ...
2.725	21.474
8.867	27.969
15.524	36.909
18.222	44.804
19.886	47.193
23.231	59.378
28.615	69.614
28.906	86.266
35.143	77.942
55.827	199.172
67.028	183.819
67.271	238.128
74.398	227.909
74.441	247.661];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(32.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EiseGoul1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'GoulEise1966 give some growth data, but this shows that healthy growth did not occur';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4X2V5'; % Cat of Life
metaData.links.id_ITIS = '633514'; % ITIS
metaData.links.id_EoL = '1178675'; % Ency of Life
metaData.links.id_Wiki = 'Setifer_setosus'; % Wikipedia
metaData.links.id_ADW = 'Setifer_setosus'; % ADW
metaData.links.id_Taxo = '60683'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11100047'; % MSW3
metaData.links.id_AnAge = 'Setifer_setosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Setifer_setosus}}';
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
bibkey = 'GoulEise1966'; type = 'Article'; bib = [ ... 
'author = {Gould, E. and Eisenberg, J. E.}, ' ... 
'year = {1966}, ' ...
'title = {Notes on the biology of the {T}enrecidae}, ' ...
'journal = {J. Mammalogy}, ' ...
'volume = {47}, ' ...
'pages = {660--686}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EiseGoul1970'; type = 'Article'; bib = [ ... 
'author = {Eisenberg, J. E. and Gould, E.}, ' ... 
'year = {1970}, ' ...
'title = {The tenrecs: a study in mammalian behavior and evolution}, ' ...
'journal = {Smith. Contrib. Zool.}, ' ...
'volume = {27}, ' ...
'pages = {1-138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Setifer_setosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

