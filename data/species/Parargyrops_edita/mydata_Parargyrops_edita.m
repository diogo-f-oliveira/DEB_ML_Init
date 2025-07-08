function [data, auxData, metaData, txtData, weights] = mydata_Parargyrops_edita

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Parargyrops_edita'; 
metaData.species_en = 'Crimson seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCim', 'biCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 03 16];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 16];

%% set data
% zero-variate data

data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(18.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'HouFeng2008';   
  temp.am = C2K(18.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Evynnis tumifrons: 14.9*26.2/35';
data.Li  = 26.2;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 541;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02818*Li^3.02, see F1';

data.Ri = 80531/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Evynnis tumifrons';
  
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1  8.77
    2 11.72
    3 14.64
    4 16.80
    5 19.53
    6 20.98
    7 23.37];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(18.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HouFeng2008';
  
% lengt-weight
data.LW = [ ... % std length (cm), weight (g)
4.837	7.975
4.914	13.803
5.149	9.129
5.656	2.113
5.889	14.931
6.007	5.597
6.163	7.924
6.201	21.916
6.982	16.055
7.098	23.048
7.177	6.718
7.293	19.542
7.760	33.518
7.801	14.857
8.035	18.347
8.306	32.330
8.422	47.486
8.425	11.334
8.542	19.493
8.813	41.640
8.853	31.143
9.010	20.641
9.282	33.458
9.360	33.455
9.593	42.776
9.669	55.601
9.828	25.274
9.943	52.092
10.294	52.078
10.371	61.404
10.647	36.904
10.839	63.719
10.879	52.055
10.916	74.211
11.232	38.047
11.307	66.033
11.308	55.537
11.539	85.849
11.698	55.522
11.813	74.176
11.894	48.517
11.932	59.011
12.046	90.494
12.282	71.826
12.435	95.143
12.474	102.139
12.593	79.977
12.907	58.973
13.097	114.943
13.099	90.453
13.370	110.267
13.491	76.443
13.525	123.089
13.639	152.239
13.721	109.088
13.759	128.911
13.953	137.067
14.147	141.724
14.191	99.740
14.266	121.894
14.573	182.524
14.617	123.047
14.692	158.029
14.697	106.717
14.733	135.870
14.931	103.210
15.120	174.339
15.164	123.026
15.237	172.002
15.468	198.816
15.473	154.501
15.661	220.966
15.663	201.140
15.787	132.331
15.816	231.455
15.937	189.468
15.939	170.809
16.211	182.460
16.252	166.132
16.254	143.975
16.404	204.610
16.480	229.097
16.681	159.118
16.715	212.761
16.873	196.429
16.945	252.402
17.225	185.919
17.294	275.713
17.373	269.879
17.494	224.393
17.535	205.732
17.879	283.853
17.888	187.060
17.922	237.204
18.156	241.860
18.501	298.989
18.537	335.139
19.006	322.293
19.042	351.446
19.706	351.421
19.786	330.426
20.446	360.721
20.559	396.868
20.560	387.539
21.222	401.507
21.840	467.956
21.892	329.178
22.308	466.771
22.690	550.721
24.821	704.574];
units.LW   = {'cm', 'g'};  label.LW = {'std length', 'weight'};  
bibkey.LW = 'HouFeng2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02818*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34TV8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580084'; % Ency of Life
metaData.links.id_Wiki = 'Parargyrops_edita'; % Wikipedia
metaData.links.id_ADW = 'Parargyrops_edita'; % ADW
metaData.links.id_Taxo = '3415434'; % Taxonomicon
metaData.links.id_WoRMS = '273967'; % WoRMS
metaData.links.id_fishbase = 'Parargyrops-edita'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parargyrops_edita}}';
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
bibkey = 'HouFeng2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11802-008-0457-7}, ' ...
'author = {Gang Hou and Bo Feng and Huosheng Lu and Junfeng Zhu}, ' ... 
'year = {2008}, ' ...
'title = {Age and growth characteristics of crimson sea bream \emph{Paragyrops edita} {T}anaka in {B}eibu {G}ulf}, ' ...
'volume = {7(4)}, ' ...
'pages = {457–465}, ' ...
'journal = {J. Ocean Univ. Chin.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Parargyrops-edita.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
