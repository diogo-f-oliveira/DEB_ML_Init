function [data, auxData, metaData, txtData, weights] = mydata_Varecia_variegata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lemuridae';
metaData.species    = 'Varecia_variegata'; 
metaData.species_en = 'Black-and-white ruffed lemur'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2021 12 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 25]; 

%% set data
% zero-variate data

data.tg = 98;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW gives 117 d';
data.tx = 7.5*30.5;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 605;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 649;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 110;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';
  comment.Li = '100-120 cm';
  
data.Wwb = 80;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BeniMill1981';
  comment.Wwb = 'ADW: 87.2 g';
data.Wwi = 3482;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: 2.5 to 4.8 kg';

data.Ri  = 1.9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.9 pups per litter, 1 litter per yr';
   
% univariate data

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
0.007	75.230
0.008	79.426
0.009	83.621
7.010	88.655
7.013	110.230
7.070	94.650
14.016	124.854
14.074	115.866
14.074	118.863
20.959	139.475
20.960	144.270
21.021	158.056
21.022	159.255
21.023	165.847
28.033	224.221
28.035	235.608
28.039	259.581
28.087	193.058
28.087	193.058
28.163	291.349
35.100	270.011
35.101	276.603
35.118	380.285
35.171	343.130
35.172	345.527
35.301	406.062];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BeniMill1981';
comment.tWw = 'Hand-reared; Deviating individuals not included';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7FHRK'; % Cat of Life
metaData.links.id_ITIS = '572873'; % ITIS
metaData.links.id_EoL = '326534'; % Ency of Life
metaData.links.id_Wiki = 'Varecia_variegata'; % Wikipedia
metaData.links.id_ADW = 'Varecia_variegata'; % ADW
metaData.links.id_Taxo = '65502'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100061'; % MSW3
metaData.links.id_AnAge = 'Varecia_variegata'; % AnAge

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: tpm and tWw data added, Wwx deleted, data chnaged';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varecia_variegata}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Varecia_variegata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Varecia_variegata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeniMill1981'; type = 'article'; bib = [ ...  
'author = {K. Benirschke and C. J. Miller}, ' ...
'year = {1981}, ' ...
'title  = {Weights and Neonatal Growth of Ring-Tailed Lemurs (\emph{Lemur catta}) and Ruffed Lemurs (\emph{Lemur variegatus})}, ' ...
'pages = {107-111}, ' ...
'volume = {12(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

