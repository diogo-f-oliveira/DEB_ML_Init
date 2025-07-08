function [data, auxData, metaData, txtData, weights] = mydata_Squatina_dumeril

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squatiniformes'; 
metaData.family     = 'Squatinidae';
metaData.species    = 'Squatina_dumeril'; 
metaData.species_en = 'Sand devil'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 06];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 01 06];

%% set data
% zero-variate data;
data.ab = 12*30.5;    units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'Wiki';    
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 26*365; units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'BareAndr2009'; 
  temp.tp = C2K(12); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 35*365;   units.am = 'd';      label.am = 'life span';                  bibkey.am = 'BareAndr2009';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 26;      units.Lb  = 'cm';    label.Lb  = 'total length at birth';     bibkey.Lb  = 'Wiki';
  comment.Lb = '25 to 30 cm';
data.Lp = 85;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BareAndr2009'; 
  comment.Lp = '92 to 107 cm';
data.Li  = 152;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 


data.Ri  = 20/365/2;units.Ri  = '#/d';      label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 25 pups per litter, multi-yr cycle, 2 yrs assumed';
  
% univariate data
 
% time-length data post birth
data.tL = [ ... % time since birth (yr), total length (cm)
1.885	30.100
2.890	27.692
2.953	29.298
3.079	30.903
4.022	27.692
4.022	28.495
4.022	30.502
4.964	30.100
4.964	34.114
5.907	28.094
5.907	29.298
5.907	31.706
5.907	34.114
5.907	40.936
6.912	30.100
6.912	32.508
7.038	37.324
7.038	43.344
7.038	45.351
7.855	38.930
7.917	37.324
7.917	44.548
8.043	92.308
8.923	79.866
8.923	36.923
8.923	38.528
8.923	40.134
8.923	42.140
8.923	43.746
9.865	49.365
9.928	36.120
9.928	38.930
9.928	41.338
9.928	44.548
9.991	54.582
10.934	38.127
10.996	45.753
11.876	43.344
11.876	44.548
11.939	47.358
11.939	49.365
12.002	53.378
12.002	54.582
12.944	49.766
12.944	56.187
12.944	57.793
13.950	53.378
13.950	54.983
14.955	50.569
14.955	54.582
14.955	58.194
14.955	63.010
14.955	66.221
15.018	68.227
15.835	52.174
15.898	60.201
15.898	63.010
15.898	66.221
15.898	65.418
15.961	71.438
16.903	75.050
16.903	78.261
16.966	62.207
16.966	66.221
17.029	57.793
17.154	50.167
17.908	68.227
17.908	80.669
17.908	82.274
17.971	64.615
18.097	61.405
18.914	59.799
18.977	72.642
18.977	73.846
18.977	77.458
18.977	81.873
18.977	90.301
19.039	61.405
19.039	63.411
19.039	65.017
19.039	67.425
19.919	82.274
19.982	64.615
19.982	66.221
19.982	88.696
20.045	67.826
20.045	74.247
20.736	75.853
20.799	77.860
20.862	87.090
20.862	89.900
21.804	72.642
21.867	82.274
21.930	84.281
21.930	90.702
21.993	87.492
21.993	94.716
21.993	99.532
22.873	84.682
22.873	87.090
22.935	92.308
22.935	95.117
22.935	102.341
23.941	74.649
23.941	75.853
23.941	82.676
23.941	88.294
24.004	95.518
24.004	99.933
24.004	104.749
24.883	92.308
24.883	94.716
25.009	100.736
25.135	84.682
25.763	82.274
25.952	91.906
25.952	99.532
25.952	99.933
25.952	103.946
26.077	111.973
26.768	93.913
26.768	95.518
26.831	86.689
26.957	99.933
26.957	101.940
26.957	104.749
27.020	107.559
27.774	56.589
27.899	106.355
27.962	89.097
27.962	89.900
28.025	99.130
28.025	102.742
28.779	48.963
28.779	109.565
28.905	95.920
28.968	99.933
28.968	101.940
28.968	105.552
29.031	115.585
29.973	78.261
30.036	107.960
30.036	103.144
30.036	101.538
30.036	98.328
30.790	95.117
32.047	95.518
32.110	74.247
32.864	92.709];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
n = size(data.tL, 1);
for i = 2:n
  if data.tL(i,1) <= data.tL(i-1,1) 
    data.tL(i,1) = data.tL(i-1,1) + 1e-6;
  end
end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'BareAndr2009';

% time-weight data post birth
data.tW = [ ... % time since birth (yr), weight (g)
1.948	234.899
2.890	187.919
3.896	281.879
4.964	281.879
5.781	93.960
5.844	657.718
6.912	187.919
6.912	328.859
6.975	704.698
7.792	704.698
7.792	516.779
7.792	328.859
7.917	6295.302
8.797	234.899
8.797	422.819
8.860	751.678
8.923	3946.309
9.865	375.839
9.865	563.758
9.865	939.597
9.865	1127.517
10.934	187.919
10.934	751.678
11.939	563.758
11.939	845.638
11.939	1127.517
11.939	2302.013
12.882	986.577
12.882	1268.456
12.882	1456.376
13.887	1127.517
13.887	1315.436
14.767	1033.557
14.767	1221.477
14.767	1738.255
14.767	1926.174
14.767	2067.114
14.767	2255.034
15.772	1127.517
15.772	1362.416
15.835	1597.315
15.835	1879.195
15.835	2255.034
15.961	2771.812
16.777	1879.195
16.777	2067.114
16.777	2442.953
16.840	1033.557
16.840	1550.336
16.966	3241.611
16.966	3805.369
17.720	1644.295
17.783	2114.094
17.846	2255.034
17.846	2442.953
17.846	3946.309
17.846	4134.228
18.851	3100.671
18.851	3194.631
18.851	3664.430
18.851	3993.289
18.914	2255.034
18.914	2442.953
18.914	6389.262
18.977	1503.356
18.977	1597.315
19.794	2255.034
19.794	2442.953
19.919	3053.691
19.919	3241.611
19.982	4228.188
19.982	5073.826
20.799	3382.550
20.862	4651.007
20.862	4932.886
20.862	6248.322
21.804	7845.638
21.867	3006.711
21.867	4369.128
21.867	5026.846
21.867	5308.725
21.867	6107.383
21.867	6483.221
22.810	4416.107
22.810	5214.765
22.810	5637.584
22.810	6201.342
22.873	8503.356
22.935	7187.919
23.878	3194.631
23.878	3946.309
23.878	4228.188
23.878	7422.819
23.941	5449.664
23.941	5590.604
23.941	6201.342
23.941	9724.832
24.758	4604.027
24.883	7610.738
24.946	9020.134
25.009	6295.302
25.889	7516.779
25.889	7798.658
25.952	7140.940
25.952	8644.295
25.952	8879.195
25.952	9771.812
26.014	3946.309
26.014	6013.423
26.768	5825.503
26.831	6859.060
26.894	8691.275
26.894	8832.215
26.894	9302.013
26.894	10006.711
26.957	7516.779
26.957	8033.557
27.837	1503.356
27.837	7516.779
27.837	7751.678
27.837	8080.537
27.837	8362.416
27.962	5308.725
27.962	5637.584
27.962	9395.973
28.779	986.577
28.779	7657.718
28.968	12261.745
29.031	8221.477
29.031	8597.315
29.031	10946.309
29.031	6671.141
29.785	3335.570
29.785	7469.799
29.910	9067.114
29.910	9442.953
30.978	7234.899
31.858	8738.255
32.047	2912.752
33.115	8221.477];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
n = size(data.tW, 1);
for i = 2:n
  if data.tW(i,1) <= data.tW(i-1,1) 
    data.tW(i,1) = data.tW(i-1,1) + 1e-6;
  end
end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BareAndr2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'All temperatures are guessed';
D2 = 'The tL and tW data strongly suggest a step-up in food availabilty, which has been taken into account';
D3 = 'tp -s ignored due to inconsistency of (tp,Lp) with tL data';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Marine; bathydemersal; depth typically at 128 m ';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6ZFHF'; % Cat of Life
metaData.links.id_ITIS = '160787'; % ITIS
metaData.links.id_EoL = '46560324'; % Ency of Life
metaData.links.id_Wiki = 'Squatina_dumeril'; % Wikipedia
metaData.links.id_ADW = 'Squatina_dumeril'; % ADW
metaData.links.id_Taxo = '106305'; % Taxonomicon
metaData.links.id_WoRMS = '158525'; % WoRMS
metaData.links.id_fishbase = 'Squatina-dumeril'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squatina_dumeril}}'; 
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
bibkey = 'BareAndr2009'; type = 'Article'; bib = [ ... 
'author = {Ivy Elizabeth Baremore and Kate Irene Andrews and Loraine Frances Hale}, ' ... 
'year = {2009}, ' ...
'title = {Difficulties associated with modeling growth in the {A}tlantic angel shark (\emph{Squatina dumeril})}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {99}, ' ...
'pages = {203-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Squatina-dumeril.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

