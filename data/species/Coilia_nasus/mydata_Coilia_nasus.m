  function [data, auxData, metaData, txtData, weights] = mydata_Coilia_nasus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Coilia_nasus'; 
metaData.species_en = 'Japanese grenadier anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 17];

%% set data
% zero-variate data
data.ab = 7.75; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'XuTang2011';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'feeding starts at 6 d post hatch; hatch at 1.75 d';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = '24-27 cm';
data.Li = 41;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 51.75;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00257*Lp^3.06, see F1';
data.Wwi = 221.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00257*Li^3.06, see F1';

data.Ri  = 114531/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), std length (cm)
3.967	0.579
3.971	0.499
4.019	0.624
4.077	0.539
5.098	0.620
5.152	0.611
5.153	0.602
5.203	0.687
5.204	0.647
5.959	0.642
6.062	0.763
6.119	0.683
6.171	0.727
6.176	0.615
6.813	0.844
6.925	0.736
7.997	0.889
8.001	0.804
8.052	0.853
9.072	0.947
9.936	0.929
10.849	0.988
10.959	0.952
11.009	1.033
11.871	1.037
11.924	1.073
12.138	1.104
12.199	0.947
12.944	1.172
13.044	1.329
13.164	1.064
13.906	1.338
13.915	1.145
13.959	1.378
14.125	1.279
14.135	1.059
14.979	1.459
14.995	1.104
15.048	1.136
15.095	1.270
15.097	1.239
15.796	1.284
15.855	1.172
15.899	1.382
15.951	1.418
16.000	1.539
16.127	1.118
16.165	1.472
16.213	1.602
16.980	1.329
16.983	1.257
17.071	1.705
17.792	1.252
17.895	1.347
18.099	1.602
18.853	1.638
18.915	1.445
18.917	1.400
18.925	1.216
18.948	1.903
18.951	1.853
18.952	1.822
18.953	1.791
19.021	1.481
19.029	1.302
19.824	1.611
19.866	1.876
19.973	1.907
20.047	1.459
20.837	1.867
20.887	1.961
20.888	1.921
20.910	1.441
21.007	1.670
21.009	1.643
21.012	1.575
21.746	2.037
21.747	2.006
21.852	2.064
21.857	1.966
21.881	1.423
21.979	1.634
22.842	1.638
22.885	1.876
22.888	1.809
22.988	1.988
23.052	1.759
23.055	1.701
23.843	2.159
23.845	2.114
23.967	1.782
24.917	2.239
24.927	2.019
24.930	1.943
24.934	1.862
24.979	2.055
24.990	1.827
24.991	1.800
25.091	1.979
25.834	2.226
25.835	2.208
26.008	1.961
26.056	2.087
26.067	1.849
26.814	2.010
26.860	2.185
26.865	2.091
26.871	1.948
26.911	2.266
26.913	2.208
26.930	1.840
27.777	2.181
27.940	2.145
27.949	1.943
28.858	2.118
28.913	2.087
28.959	2.271
29.015	2.221
29.872	2.356
29.936	2.123
29.982	2.298
30.038	2.239
30.041	2.181
30.145	2.262
30.839	2.419
30.895	2.374
30.897	2.338
30.955	2.244
31.011	2.181
31.012	2.163
31.015	2.105
31.866	2.365
31.928	2.172
31.988	2.033
32.952	2.176
33.102	2.446
33.918	2.275
33.963	2.481
34.719	2.450
34.775	2.396
34.996	2.280
35.899	2.580
35.901	2.549
35.966	2.298
36.875	2.468
36.919	2.683
36.927	2.508
36.936	2.307
37.845	2.459
38.805	2.697
38.919	2.567
38.971	2.598
39.992	2.670];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'HuanChen2014'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00257*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WWGG'; % Cat of Life
metaData.links.id_ITIS = '551440'; % ITIS
metaData.links.id_EoL = '46562648'; % Ency of Life
metaData.links.id_Wiki = 'Coilia_nasus'; % Wikipedia
metaData.links.id_ADW = 'Coilia_nasus'; % ADW
metaData.links.id_Taxo = '171569'; % Taxonomicon
metaData.links.id_WoRMS = '279083'; % WoRMS
metaData.links.id_fishbase = 'Coilia-nasus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Coilia_nasus}}';  
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
bibkey = 'HuanChen2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-014-0701-6}, ' ...
'author = {Yanfei Huang and Fei Cheng and Brian R. Murphy and Songguang Xie}, ' ...
'year = {2014}, ' ...
'title = {Sagittal otolith microstructure, early growth and development of \emph{Coilia ectenes} in the {Y}angtze {E}stuary, {C}hina}, ' ... 
'journal = {Fish Sci}, ' ...
'volume = {80}, '...
'pages = {435–443}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'XuTang2011'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-2109.2010.02655.x}, ' ...
'author = {Gangchun Xu and Xue Tang and Chengxiang Zhang and Ruobo Gu and Jinliang Zheng and Pao Xu and Guowei Le}, ' ...
'year = {2011}, ' ...
'title = {First studies of embryonic and larval development of \emph{Coilia nasus} ({E}ngraulidae) under controlled conditions}, ' ... 
'journal = {Aquaculture Research}, ' ...
'volume = {42(4)}, '...
'pages = {593–601}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coilia-nasus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  