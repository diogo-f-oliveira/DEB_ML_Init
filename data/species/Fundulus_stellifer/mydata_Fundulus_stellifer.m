  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_stellifer
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_stellifer'; 
metaData.species_en = 'Southern studfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 01]; 

%% set data
% zero-variate data
data.am = 2.2*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'EdbePowe2010';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 4;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'EdbePowe2010'; 
data.Lpm = 4;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty'; bibkey.Lpm = 'EdbePowe2010'; 
data.Li = 9.429;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'EdbePowe2010';
data.Lim = 9.607;     units.Lim = 'cm';     label.Lim = 'ultimate standard length for males';  bibkey.Lim = 'EdbePowe2010';

data.Wwb = 1.09e-2;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'EdbePowe2010';   
  comment.Wwb = 'based on egg diameter of 2.75 mm: pi/6*0.275^3';
data.Wwi = 19.9;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EdbePowe2010';   
data.Wwim = 18.6;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'EdbePowe2010';   

data.Ri = 308/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'EdbePowe2010';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time - length
data.tL = [ ... % time (d), std length (cm)
180.697	1.721
182.626	1.947
211.974	1.874
213.260	2.025
213.869	1.572
213.911	2.226
213.929	2.502
242.766	4.414
243.337	3.358
243.351	3.585
243.359	3.710
243.951	2.982
272.683	3.260
272.695	3.436
272.703	3.561
274.006	3.989
274.011	4.064
274.633	3.813
275.997	5.195
302.659	3.011
302.675	3.262
302.684	3.413
303.385	4.393
303.395	4.543
303.973	3.614
304.620	3.739
304.632	3.940
332.605	2.309
333.343	3.867
333.894	2.510
333.907	2.711
333.994	4.068
334.560	2.938
334.609	3.716
336.496	3.289
336.509	3.490
363.387	4.698
363.894	2.638
363.907	2.839
363.987	4.095
365.191	2.965
365.210	3.266
365.220	3.417
365.229	3.568
365+28.978	4.097
365+30.144	2.364
365+30.160	2.615
365+30.229	3.695
365+30.237	3.821
365+30.245	3.947
365+30.807	2.766
365+30.860	3.595
365+32.103	3.067
365+32.765	3.444
365+59.524	2.793
365+59.534	2.944
365+60.788	2.592
365+60.829	3.245
365+60.837	3.371
365+60.874	3.949
365+61.554	4.602
365+62.139	3.773
365+90.789	2.745
365+92.081	2.996
365+92.091	3.147
365+92.115	3.524
365+92.129	3.750
365+92.212	5.057
365+120.903	4.682
365+121.447	3.199
365+121.471	3.576
365+121.490	3.878
365+121.500	4.028
365+121.508	4.154
365+121.516	4.280
365+121.551	4.832
365+121.564	5.033
365+123.498	5.335
365+123.509	5.511
365+150.904	4.834
365+150.956	5.638
365+151.010	6.493
365+151.639	6.342
365+151.676	6.920
365+152.129	4.030
365+152.141	4.206
365+180.942	5.565
365+180.950	5.691
365+180.958	5.816
365+181.540	4.937
365+181.552	5.113
365+181.558	5.213
365+181.564	5.314
365+181.572	5.440
365+181.609	6.017
365+182.167	4.761
365+182.794	4.585
365+183.556	6.520
365+213.457	5.115
365+213.477	5.417
365+213.560	6.723
365+214.179	6.422
365+214.232	7.251
365+214.854	7.000
365+242.233	6.072
365+242.249	6.323
365+242.259	6.474
365+242.275	6.725
365+243.574	7.077
365+244.117	5.595
365+273.551	6.853
365+273.586	7.406
365+275.444	6.526
365+275.526	7.808
365+302.930	7.257
365+302.949	7.558
365+304.158	6.503
365+304.196	7.106
365+334.811	6.882
365+336.115	7.309
365+363.536	7.035
365+363.581	7.739
365+364.753	6.105
365+364.764	6.281
365+365.366	5.703
365+365.460	7.186
730+30.360	5.756
730+30.378	6.032
730+31.053	6.610
730+31.083	7.087
730+59.079	5.808
730+59.803	7.165
730+60.384	6.260
730+60.406	6.612
730+60.505	8.170
730+61.121	7.818
730+61.750	7.667
730+91.214	9.403
730+92.315	6.665
730+92.382	7.720
730+92.406	8.097
730+92.966	6.866
730+92.977	7.041
730+93.631	7.293
730+121.699	7.144
730+121.705	7.244
730+121.718	7.445
730+121.736	7.722
730+121.755	8.023
730+121.763	8.149
730+121.792	8.601
730+151.124	8.277
730+151.143	8.578
730+151.155	8.754
730+151.809	9.005
730+151.820	9.181
730+151.841	9.508
730+182.446	9.133
730+213.074	9.110
730+213.095	9.437
730+214.320	8.633
730+243.061	9.037
730+243.739	9.665
730+303.682	9.041
730+303.706	9.418];
data.tL(:,1) = data.tL(:,1) - 120; % set origin on birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EdbePowe2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.spd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo SL =  0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6K3H2'; % Cat of Life
metaData.links.id_ITIS = '165668'; % ITIS
metaData.links.id_EoL = '1156711'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_stellifer'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_stellifer'; % ADW
metaData.links.id_Taxo = '174589'; % Taxonomicon
metaData.links.id_WoRMS = '1020268'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-stellifer'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_stellifer}}';
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
bibkey = 'EdbePowe2010'; type = 'Article'; bib = [ ...
'doi = {10.1656/058.009.0110}, ' ...
'author = {Kerstin L. Edberg and Steven L. Powers}, ' ...
'year = {2010}, ' ...
'title = {Life-History Aspects of \emph{Fundulus stellifer} (Southern Studfish) ({A}ctinopterygii: {F}undulidae) in {N}orthern {G}eorgia}}, ' ... 
'journal = {Southeastern Naturalist}' , ...
'volume = {9(1)}, ' ...
'pages = {119-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-stellifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


