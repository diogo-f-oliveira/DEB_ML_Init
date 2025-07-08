function [data, auxData, metaData, txtData, weights] = mydata_Megaderma_lyra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Megadermatidae';
metaData.species    = 'Megaderma_lyra'; 
metaData.species_en = 'Greater false vampire bat'; 

metaData.ecoCode.climate = {'Am', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data

data.tg = 150;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 540;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 450;    units.tpm = 'd';    label.tpm = 'time since birth at first litter male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(34.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 35;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'RajaMari1999';
  comment.Wwi = 'AnAge: 38.6 g; Wiki: 40 to 60 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'RajaMari1999';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
1.514	10.549
1.515	11.021
1.517	11.651
1.675	12.438
2.460	11.807
4.273	14.009
4.431	14.403
5.054	11.646
5.453	14.637
6.162	15.109
6.947	14.714
8.916	16.207
9.624	16.520
10.804	17.148
12.139	16.359
12.143	18.327
13.952	18.718
14.659	18.402
17.018	18.713
18.985	19.340
20.164	19.338
20.401	19.889
21.744	23.194
22.287	19.808
22.289	20.752
23.311	20.436
25.434	20.590
25.437	22.401
27.244	21.768
28.269	23.341
28.663	23.892
29.291	23.419
30.236	23.968
30.467	21.527
31.963	22.627
34.560	24.276
36.055	24.668
38.020	24.665
38.575	26.711
38.649	24.821
39.518	26.552
40.226	27.181
40.382	26.551
41.799	27.415
41.880	28.517
43.295	28.436
44.318	29.064
44.479	31.111
45.028	30.480
46.444	30.872
46.529	33.785
47.786	33.626
47.863	32.602];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RajaMari1999';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by E_Hp only';
D3 = 'scaled functional response turned out to vary during handrearing';
D4 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '5TJFL'; % Cat of Life
metaData.links.id_ITIS = '631755'; % ITIS
metaData.links.id_EoL = '328821'; % Ency of Life
metaData.links.id_Wiki = 'Lyroderma_lyra'; % Wikipedia
metaData.links.id_ADW = 'Megaderma_lyra'; % ADW
metaData.links.id_Taxo = '168689'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800874'; % MSW3
metaData.links.id_AnAge = 'Megaderma_lyra'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megaderma_lyra}}';
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
bibkey = 'RajaMari1999'; type = 'Article'; bib = [ ... 
'author = {K. E. Rajan and G. Marimuthu}, ' ... 
'year = {1999}, ' ...
'title = {Postnatal growth and age estimation in the {I}ndian false vampire bat (\emph{Megaderma lyra})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {248}, ' ...
'pages = {529-534}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Megaderma_lyra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

