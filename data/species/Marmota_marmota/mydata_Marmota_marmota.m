function [data, auxData, metaData, txtData, weights] = mydata_Marmota_marmota
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Marmota_marmota'; 
metaData.species_en = 'Alpine marmot'; 

metaData.ecoCode.climate = {'Dfb','ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 06 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2022 06 22];              

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 47;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 30;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 5000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '1.9-8 kg, AnAge gives 3.5 kg';

data.Ri  = 4/3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 1 litter per 3 yrs';

% univariate data
data.tWw = [ ... % time since emergence (d), weight (g)
0.000	288.462
0.000	404.831
0.669	273.117
0.937	612.132
0.937	217.395
1.071	561.497
1.205	470.377
1.205	374.223
1.205	434.952
1.339	298.285
1.339	333.710
1.473	247.651
1.473	409.594
1.874	708.096
2.008	495.518
2.008	353.818
2.276	434.735
2.544	328.406
2.544	379.013
2.677	490.322
2.811	535.841
3.347	434.518
3.614	596.407
3.614	252.278
3.614	232.035
3.748	388.890
3.882	312.952
4.150	535.570
4.150	495.084
4.685	581.008
4.685	414.004
4.953	312.736
5.087	596.109
5.221	535.353
5.221	494.868
5.756	661.763
5.756	692.128
5.756	423.909
6.158	494.678
6.560	514.840
6.693	641.331
6.827	605.878
6.827	428.753
6.827	362.963
7.095	560.278
7.631	696.809
8.434	479.035
8.701	387.888
8.969	509.291
9.103	610.479
9.505	534.486
9.772	807.711
9.772	382.610
9.772	453.460
9.772	483.825
10.977	625.281
10.977	508.885
11.111	685.983
11.111	367.157
11.780	549.208
12.182	1009.653
12.182	432.730
12.718	847.601
12.851	614.780
13.253	675.428
13.521	508.370
13.788	1054.874
14.190	730.906
15.127	649.745
15.261	538.382
15.395	695.237
15.930	674.886
15.930	639.461
15.930	614.157
16.734	907.517
17.001	720.216
17.135	457.031
17.269	674.615
17.671	826.356
17.938	881.969
19.813	744.950
20.884	906.677
21.687	1205.097
21.821	896.366
21.954	1103.828
22.758	1037.876
23.025	1133.976
24.230	744.056
24.498	744.002
26.640	743.568
26.640	794.176
27.041	561.301
28.246	1259.437
28.246	935.551
28.782	1097.386
28.782	1036.657
29.853	995.954
30.924	813.551
31.995	1142.282
31.995	960.096
32.798	1344.548
34.806	949.405
36.011	954.222
37.617	1196.812
37.885	1358.701
38.153	1135.975
38.956	882.776
40.161	801.560
40.295	842.019
40.428	1095.028
42.035	1135.189
43.775	1802.853
44.177	1099.330
44.712	1291.529
44.712	1382.622
44.712	1504.080
44.712	1731.813
44.846	1954.458
48.327	1336.344
48.728	1381.809
50.736	1194.156
51.004	1654.628
51.004	1133.373
51.539	1452.091
52.878	1299.998
53.949	1881.765
55.154	1350.144
64.525	1980.838
65.863	1327.733
65.997	1383.374
66.801	1195.965
67.871	1195.748
69.612	1382.643
71.084	2045.300
71.084	1392.466
73.896	1655.055
75.100	1599.143
78.581	1902.082
78.715	2150.031
78.849	2114.579
79.652	1911.987
79.652	1820.894
79.652	2296.602
82.062	2002.592
82.865	1805.061
84.873	2138.663
91.834	2349.804];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(37);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'AllaGraz1991';


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

%% Links
metaData.links.id_CoL = '7VSDP'; % Cat of Life
metaData.links.id_ITIS = '632383'; % ITIS
metaData.links.id_EoL = '312651'; % Ency of Life
metaData.links.id_Wiki = 'Marmota_marmota'; % Wikipedia
metaData.links.id_ADW = 'Marmota_marmota'; % ADW
metaData.links.id_Taxo = '61898'; % Taxonomicon
metaData.links.id_MSW3 = '12400955'; % Mammal Spec World
metaData.links.id_AnAge = 'Marmota_marmota'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Marmota_marmota}}';
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
bibkey = 'AllaGraz1991'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s004420050388}, ' ...
'author = {Dominique Allain\''{e} and Laurent Graziani and Jacques Coulon}, ' ... 
'year = {1991}, ' ...
'title = {Postweaning mass gain in juvenile alpine marmots \emph{Marmota marmota}}, ' ...
'journal = {Oecologia}, ' ...
'volume = {113(3)}, ' ...
'pages = {370–376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Marmota_marmota}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

