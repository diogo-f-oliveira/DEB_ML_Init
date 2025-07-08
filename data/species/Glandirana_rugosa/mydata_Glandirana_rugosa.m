function [data, auxData, metaData, txtData, weights] = mydata_Glandirana_rugosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Glandirana_rugosa'; 
metaData.species_en = 'Japanese wrinkled frog'; 

metaData.ecoCode.climate = {'Cfa','Cwa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.tp = 2.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KhonMats2014';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 1.5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'KhonMats2014';   
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KhonMats2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.36;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess';
data.Lp  = 3.6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'KhonMats2014';
data.Li  = 5.9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'KhonMats2014';
data.Lim  = 4.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'KhonMats2014';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 15.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 10.9 g for SVL 5.29: (5.9/5.29)^3*10.9';

data.Ri  = 200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
0.327	2.141
0.328	2.230
0.394	2.166
0.406	2.406
0.414	2.280
0.416	2.520
0.418	2.684
0.426	2.583
0.430	2.987
1.055	3.537
1.065	2.414
1.068	2.767
1.072	3.209
1.072	3.323
1.073	3.411
1.076	2.590
1.077	2.679
1.078	2.881
1.079	3.020
1.090	3.121
1.160	4.585
1.163	2.792
1.164	2.817
1.168	3.309
1.169	3.398
1.174	5.153
1.176	3.183
1.184	2.981
1.185	3.095
1.208	3.549
1.248	2.614
1.250	2.879
1.272	3.157
1.319	4.192
1.321	4.419
1.324	2.614
1.340	3.295
1.351	4.659
1.413	5.151
1.413	5.201
1.440	4.949
1.455	4.444
2.071	5.058
2.072	5.121
2.082	5.234
2.085	5.575
2.086	4.540
2.087	4.691
2.105	5.714
2.107	5.853
2.169	5.297
2.170	5.398
2.175	4.893
2.175	4.956
2.176	5.082
2.177	5.196
2.183	4.741
2.254	5.220
2.256	5.397
2.257	5.574
2.258	5.650
2.264	5.309
2.332	5.422
2.369	5.295
2.449	4.575
2.449	5.711
3.098	5.631
3.106	5.416
3.181	5.289
3.184	5.592
3.196	5.908
3.197	5.996
3.258	5.389
3.271	5.781
3.367	5.843
3.428	5.098
4.187	5.610
4.440	5.090];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL','females'};  
temp.tL_f   = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KhonMats2014'; 
comment.tL_f = 'data females from Gondoike, Kyoto, Japan';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
1.067	3.739
1.077	3.891
1.079	4.093
1.099	4.206
1.100	4.295
1.175	4.092
1.176	4.307
1.177	4.382
1.237	3.536
1.238	3.637
1.248	3.789
1.249	3.890
1.250	3.991
1.264	4.495
1.280	4.180
1.287	3.776
1.326	3.889
1.328	4.129
1.346	4.066
1.423	4.090
2.054	4.149
2.055	4.237
2.084	4.388
2.085	4.489
2.089	3.744
2.097	4.767
2.148	4.072
2.149	4.123
2.170	4.287
2.196	3.983
2.254	4.097
2.348	3.970
3.080	4.671
3.081	4.785
3.084	4.015
3.214	4.695
3.369	4.896];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL','males'};  
temp.tL_m   = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_m = 'KhonMats2014'; 
comment.tL_m = 'data for males from Gondoike, Kyoto, Japan';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Tadpoles have an abdominal sucker, and adaptation to living in fast-flowing streams';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3G58B'; % Cat of Life
metaData.links.id_ITIS = '774987'; % ITIS
metaData.links.id_EoL = '1019296'; % Ency of Life
metaData.links.id_Wiki = 'Glandirana_rugosa'; % Wikipedia
metaData.links.id_ADW = 'Glandirana_rugosa'; % ADW
metaData.links.id_Taxo = '996463'; % Taxonomicon
metaData.links.id_WoRMS = '1488234'; % WoRMS
metaData.links.id_amphweb = 'Glandirana+rugosa'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glandirana_rugosa}}';
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
bibkey = 'KhonMats2014'; type = 'Article'; bib = [ ...
'doi = {10.2108/zsj.18.605}, ' ...
'author = {Khonsue, Wichase and Matsui, Masafumi and Hirai, Toshiaki and Misawa, Yasuchika}, ' ... 
'year = {2014}, ' ...
'title = {Age Determination of Wrinkled Frog, \emph{Rana rugosa} with Special Reference to High Variation in Postmetamorphic Body Size ({A}mphibia: {R}anidae)}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {18(4)}, ' ...
'pages = {605-612}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Glandirana+rugosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

