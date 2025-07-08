function [data, auxData, metaData, txtData, weights] = mydata_Ondatra_zibethicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Ondatra_zibethicus'; 
metaData.species_en = 'Muskrat'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 01 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1      = {'Bas Kooijman'};    
metaData.date_mod_1   = [2018 07 07];              
metaData.email_mod_1       = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 07]; 

%% set data
% zero-variate data

data.tg = 26;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 285;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data is uncertain';

data.Wwb = 22.72;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 152.1;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 1362; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';

data.Ri  = 6.7*2.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.7 pups per litter; 2.7 litters per yr';

% uni-variate data
% time-weight data
data.tW = [ % time since birth (d), weight (g)
20.534	118.590
28.747	176.338
34.908	262.227
44.353	351.216
50.103	418.359
54.620	448.011
62.423	505.762
68.583	541.652
75.565	575.972
82.136	605.608
89.117	643.054
96.920	685.180
103.491	686.691
109.651	696.018
116.632	711.589
123.614	738.097
131.417	730.223
137.577	750.488
145.791	730.111
151.129	737.882
179.055	764.226
186.037	754.797
193.429	765.676
200.821	767.181]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW  = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GaillPont1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mod_1 includes data tW';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '49JSC'; % Cat of Life
metaData.links.id_ITIS = '180318'; % ITIS
metaData.links.id_EoL = '313678'; % Ency of Life
metaData.links.id_Wiki = 'Ondatra_zibethicus'; % Wikipedia
metaData.links.id_ADW = 'Ondatra_zibethicus'; % ADW
metaData.links.id_Taxo = '62758'; % Taxonomicon
metaData.links.id_WoRMS = '1451012'; % WoRMS
metaData.links.id_MSW3 = '13000330'; % MSW3
metaData.links.id_AnAge = 'Ondatra_zibethicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ondatra_zibethicus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ondatra_zibethicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaillPont1997'; type = 'Article'; bib = [ ... 
'author = {J.-M. Gaillard and D. Pontier and D. Allaine and A. Loison and J.-C. Herves and A. Heizmann}, ' ...
'year = {1997}, ' ...
'title  = {Variation in growth form and precocity at birth in eutherian mammals}, ' ...
'journal = {Proc. R. Soc. Lond. B}, ' ...
'volume = {264}, ' ...
'pages = {859--868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

