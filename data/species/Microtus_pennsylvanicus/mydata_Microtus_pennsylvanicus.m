function [data, auxData, metaData, txtData, weights] = mydata_Microtus_pennsylvanicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_pennsylvanicus'; 
metaData.species_en = 'Meadow vole'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc', 'Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 29];              

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '95 till 111 d';
data.tx = 14;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 29;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5); units.temp.tp = 'K'; label.temp.tpm = 'temperature';
data.tpm = 37;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.5); units.temp.tpm = 'K'; label.temp.tp = 'temperature';
data.am = 3.9*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(38.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';
  
data.Wwb = 2.46;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 11.52;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 49;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';

data.Ri  = 5.5*2.6/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.5 pups per litter; 2.6 litters per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.505	2.216
6.514	5.065
11.524	5.774
13.027	10.288
13.528	7.357
20.543	13.135
23.549	15.905
28.560	17.961
36.576	21.995
62.630	26.018
89.687	31.069
117.244	34.061
144.802	35.864
227.474	42.067];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZullRick1984';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7VV89'; % Cat of Life
metaData.links.id_ITIS = '180297'; % ITIS
metaData.links.id_EoL = '1037788'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_pennsylvanicus'; % Wikipedia
metaData.links.id_ADW = 'Microtus_pennsylvanicus'; % ADW
metaData.links.id_Taxo = '62713'; % Taxonomicon
metaData.links.id_MSW3 = '13000290'; % Mammal Spec World
metaData.links.id_AnAge = 'Microtus_pennsylvanicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_pennsylvanicus}}';
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
bibkey = 'ZullRick1984'; type = 'Article'; bib = [ ... 
'author = {E. M. Zullinger and R. E. Ricklefs and K. H. Redford and G. M. Mace}, ' ... 
'year = {1984}, ' ...
'title = {Fitting Sigmoidal Equations to Mammalian Growth Curves}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {65}, ' ...
'number = {4}, ' ...
'pages = {607--636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microtus_pennsylvanicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

