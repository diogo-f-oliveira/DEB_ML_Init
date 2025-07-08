function [data, auxData, metaData, txtData, weights] = mydata_Lepus_capensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Lepus_capensis'; 
metaData.species_en = 'Cape hare'; 

metaData.ecoCode.climate = {'BSh', 'BWh'};
metaData.ecoCode.ecozone = {'THp', 'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tW'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1      = [2018 08 11];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 08 11];              

%% set data
% zero-variate data

data.tg = 43;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 228;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.2); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.tpm = 175;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.9*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(38.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.tp = 'Data is uncertain';
  
data.Wwb = 118.4;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 943.3;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 2358;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'AnAge';

data.Ri  = 2.6*3.3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.6 pups per litter; 3.3 litters per yr';
   
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
3.096	122.313
4.154	131.654
4.872	146.524
5.969	144.757
6.838	163.342
8.009	174.544
8.841	170.904
9.710	206.156
10.655	219.192
11.335	213.689
12.469	224.888
13.187	230.499
14.699	265.801
16.173	306.655
17.458	341.939
17.950	369.755
18.290	369.781
19.461	388.390
23.694	494.272];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fren1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

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
D1 = 'Body temperature of Lepus townsendii';
D2 = 'Males are assumend to differ from females by E_Hp only';
D3 = 'Due to milk being extremely nutritious in lagomorphs, the growth rate, and therefore [p_M], is probably over-estimated with this data ';
D4 = 'mod_1: addition tW data';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Links
metaData.links.id_CoL = '6PPYS'; % Cat of Life
metaData.links.id_ITIS = '180117'; % ITIS
metaData.links.id_EoL = '327967'; % Ency of Life
metaData.links.id_Wiki = 'Lepus_capensis'; % Wikipedia
metaData.links.id_ADW = 'Lepus_capensis'; % ADW
metaData.links.id_Taxo = '61504'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500139'; % MSW3
metaData.links.id_AnAge = 'Lepus_capensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepus_capensis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lepus_capensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fren1989'; type = 'Article'; bib = [ ... 
'author = {H. J. French}, ' ... 
'year = {1989}, ' ...
'title = {Hand-rearing the brown hare \emph{Lepus capensis}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {28}, ' ...
'pages = {260--292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

