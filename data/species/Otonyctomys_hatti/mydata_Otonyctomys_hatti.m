function [data, auxData, metaData, txtData, weights] = mydata_Otonyctomys_hatti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Otonyctomys_hatti'; 
metaData.species_en = 'Hatt''s vesper rat'; 
metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 24]; 

%% set data
% zero-variate data

data.tg = 31;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'PantMacS2015';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'PantMacS2015';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Apodemus_agrarius';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'PantMacS2015';
data.Wwx = 21;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'PantMacS2015';
data.Wwi = 31;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'PantMacS2015';

data.Ri  = 1.9*8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'PantMacS2015';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.9 pups per litter; 8 litters per ? 119 d is not possible; per yr assumed';
  
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
  0	 3.665
  3	 4.701
  6	 6.370
 11	 9.780
 14	10.420
 18	12.642
 21	14.074
 24	15.980
 27	17.728
 35	18.922
 42	20.987
 49	22.181
 55	22.109
 63	23.304
 70	24.973
 77	24.980
 84	24.909
 91	27.369
 98	26.506
105	26.197
112	28.261
119	27.082];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(37.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PantMacS2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.01;
weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 2 * weights.psd.v;
%weights.psd.kap = 3 * weights.psd.kap;


%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4B7LW'; % Cat of Life
metaData.links.id_ITIS = '633249'; % ITIS
metaData.links.id_EoL = '1180027'; % Ency of Life
metaData.links.id_Wiki = 'Otonyctomys_hatti'; % Wikipedia
metaData.links.id_ADW = 'Otonyctomys_hatti'; % ADW
metaData.links.id_Taxo = '88621'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000984'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otonyctomys_hatti}}';
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
bibkey = 'PantMacS2015'; type = 'Article'; bib = [ ... 
'author = {J. A. Panti-May and C. MacSwiney G. and S. F. H. Andez-Betancourt and O. A. Valdes-Rodr\''{i}guez}, ' ... 
'year = {2015}, ' ...
'title = {Reproduction and postnatal development in the {Y}ucatan vesper mouse}, ' ...
'journal = {Mammalia}, ' ...
'volume = {79}, ' ...
'pages = {169-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1180027/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

