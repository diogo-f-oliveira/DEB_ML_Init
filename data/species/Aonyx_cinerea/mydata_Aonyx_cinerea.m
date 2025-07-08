function [data, auxData, metaData, txtData, weights] = mydata_Aonyx_cinerea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Aonyx_cinerea'; 
metaData.species_en = 'Asian small-clawed otter'; 

metaData.ecoCode.climate = {'A','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 09]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 80;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'ADW';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 18*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HeapWrig2008';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'in captivety; likely to be 2 yrs';
data.am = 23*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 110;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ReedLomb2009';
  comment.Wwb = 'AnAge gives 57 g';
data.Wwi = 4.7e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'ADW';
  comment.Wwi = 'Wiki: 2.7-5.4 kg';

data.Ri  = 2*1.42/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.42 pups per litter, 2 litters per yr';
 
% uni-variate data
% t-W data
data.tWw = [..., % time since birth (d), body weight (g) 
0.306	126.147
0.306	98.624
0.766	137.615
2.144	155.963
2.144	144.495
2.144	130.734
2.144	119.266
3.675	160.550
3.675	155.963
4.287	174.312
4.747	146.789
5.206	188.073
5.206	165.138
5.819	162.844
6.431	197.248
7.043	233.945
7.656	247.706
8.422	245.413
8.881	268.349
9.953	282.110
10.565	270.642
11.484	286.697
11.637	277.523
12.556	288.991
12.709	305.046
15.159	318.807
15.465	247.706
15.771	339.450
15.924	330.275
16.231	341.743
16.843	350.917
17.915	353.211
18.834	357.798
19.140	353.211
19.752	366.972
20.518	376.147
20.671	366.972
20.824	360.092
21.743	378.440
22.355	371.560
23.274	327.982
23.580	332.569
23.733	383.028
24.040	396.789
25.265	385.321
25.265	405.963
26.030	410.550
26.183	403.670
26.490	387.615
27.102	387.615
27.255	419.725
28.327	392.202
28.327	422.018
28.940	401.376
29.552	376.147
29.705	412.844
30.011	424.312
30.011	360.092
30.318	373.853
30.930	447.248
31.236	447.248
31.543	422.018
32.002	412.844
32.614	454.128
33.227	454.128
33.227	422.018
33.992	442.661
34.605	422.018
34.758	422.018
34.911	456.422
34.911	412.844
35.830	451.835
36.289	467.890
36.595	477.064
36.902	465.596
37.667	472.477
37.820	486.239
38.892	477.064
39.045	506.881
40.117	477.064
40.117	502.294
41.495	454.128
41.648	483.945
41.648	467.890
42.567	518.349
43.180	522.936
43.333	486.239
43.945	486.239
44.405	518.349
45.017	504.587
45.170	483.945
45.170	518.349
46.242	488.532
46.854	527.523
47.467	483.945
47.773	527.523
48.386	481.651
49.151	536.697
49.304	520.642
49.304	477.064
49.764	490.826
50.529	534.404
50.682	488.532
51.448	541.284
51.907	552.752
52.060	490.826
52.520	490.826
52.979	555.046
53.439	490.826
53.898	502.294
54.664	502.294
54.817	557.339
54.817	571.101
54.817	589.450
55.429	502.294
56.348	513.761
56.960	493.119
57.113	550.459
57.879	577.982
58.032	504.587
59.410	596.330
59.563	509.174
60.023	513.761
60.329	596.330
62.166	612.385
62.319	529.817
64.157	605.505
64.463	525.229
65.076	621.560
65.382	534.404
66.301	637.615
67.066	522.936
67.679	651.376
67.832	520.642
68.291	651.376
69.210	552.752
70.435	575.688
70.588	651.376
71.200	541.284
71.507	651.376
72.272	548.165
72.425	672.018
73.191	566.514
73.803	678.899
75.181	715.596
75.335	653.670
75.335	697.248
75.641	584.862
79.622	619.266
79.775	729.358
81.612	761.468
81.612	628.440
82.531	651.376
82.837	839.450
82.837	809.633
83.603	667.431
84.216	832.569
84.828	678.899
86.053	899.083
86.206	713.303
87.584	908.257
87.737	727.064];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38.4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ReedLomb2009';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.tp = 0.5 * weights.tp;

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
D1 = 'Males are assumed not to differ from females';
D2 = 'The poor fit is due to tp, which is too large to be captured by the stx model';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5FJW6'; % Cat of Life
metaData.links.id_ITIS = '1086357'; % ITIS
metaData.links.id_EoL = '48774803'; % Ency of Life
metaData.links.id_Wiki = 'Aonyx_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Aonyx_cinerea'; % ADW
metaData.links.id_Taxo = '66796'; % Taxonomicon
metaData.links.id_WoRMS = '404124'; % WoRMS
metaData.links.id_MSW3 = '14001085'; % MSW3
metaData.links.id_AnAge = 'Aonyx_cinerea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aonyx_cinerea}}';
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
bibkey = 'ReedLomb2009'; type = 'techreport'; bib = [ ... 
'author = {Jan Reed-Smith and Celeste Dusty Lombardi and Barb Henry and Gwen Myers and Jessica Foti anf Juan Sabalones}, ' ... 
'year = {2009}, ' ...
'title = {Caring for Asian small-clawed, Cape clawless, Nearctic, and spotted-necked otters}, ' ...
'institution = {Otterspecialistgroup}, ' ...
'howpublished = {\url{https://www.otterspecialistgroup.org/Library/TaskForces/OCT/OCT_version_of_otter_care_manual_V3_Dec09.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeapWrig2008'; type = 'techreport'; bib = [ ... 
'author = {Carol J. Heap and Lesley Wright and Lindell Andrews}, ' ... 
'year = {2009}, ' ...
'title = {Summary of Husbandry Guidelines for {A}sian Small-clawed Otters in Captivity}, ' ...
'institution = {Otterspecialistgroup}, ' ...
'howpublished = {\url{http://www.otterspecialistgroup.org/Library/TaskForces/OCT/OCT_ASO_Husbandry_Guidelines_Summary.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Aonyx_cinerea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Aonyx_cinerea/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

