  function [data, auxData, metaData, txtData, weights] = mydata_Hucho_taimen
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Hucho_taimen'; 
metaData.species_en = 'Taimen'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', '0iFe', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data
data.am = 55*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 50;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'JensGilr2009'; 
  comment.Lp = 'based on tp = 4-6 yr, so not very accurate';
data.Li = 200;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm of Stenodus leucichthys: pi/6*0.25^3';
data.Wwp = 1.4e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.04, see F1';
data.Wwi = 92.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.04, see F1; max. published weight: 105 kg';
    
data.Ri = 44e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
0.950	13.825
0.951	6.759
0.980	18.740
0.980	14.439
0.981	7.373
1.010	20.584
1.041	21.505
1.041	17.512
1.071	25.192
1.073	10.138
1.899	31.336
1.929	35.637
1.929	32.565
1.931	19.662
1.992	26.728
1.992	25.192
1.992	24.270
1.993	17.819
2.022	29.800
2.023	23.349
2.023	22.120
2.024	14.439
2.941	41.475
2.971	50.384
2.972	43.011
2.974	29.800
2.974	26.421
2.975	25.192
3.002	45.776
3.002	43.932
3.033	46.697
3.034	39.631
3.034	35.330
3.035	33.487
3.035	31.644
3.066	27.957
3.096	36.866
3.096	36.559
3.893	40.860
3.921	62.366
3.952	57.450
3.953	54.071
3.983	59.908
3.985	45.161
3.987	33.180
4.015	48.848
4.017	37.174
4.018	29.493
4.048	36.559
4.078	39.939
4.107	50.691
4.108	43.932
4.110	32.258
4.963	73.425
4.963	72.811
4.965	62.366
4.966	55.914
4.966	54.685
4.966	51.613
4.967	47.312
4.968	39.939
4.995	68.203
4.996	57.757
4.999	42.396
5.028	49.462
5.057	65.131
5.086	70.661
5.090	44.547
5.887	56.221
5.888	52.535
5.916	66.974
5.977	71.582
6.006	77.727
6.009	59.601
6.039	63.902
6.041	50.384
6.067	80.492
6.071	54.685
6.132	62.366
6.899	65.745
6.957	87.250
6.991	63.594
7.018	91.551
7.019	80.492
7.021	68.203
7.022	63.287
7.023	56.528
7.052	70.661
7.053	58.679
7.054	57.757
7.082	75.576
7.084	59.908
7.908	95.238
7.909	85.100
7.939	91.551
7.939	87.558
7.941	80.799
7.944	56.221
7.968	99.846
7.970	89.708
7.974	63.287
8.002	77.419
8.003	72.811
8.033	75.269
8.034	69.739
8.035	65.745
8.036	61.444
8.065	70.661
8.065	69.124
8.065	67.281
8.092	96.774
8.923	80.184
8.924	74.654
8.952	93.088
8.953	88.172
8.953	84.178
8.983	89.708
8.984	83.257
8.985	78.648
9.012	100.768
9.043	98.003
9.044	95.853
9.044	90.937
9.045	86.022
9.046	81.720
9.047	71.275
9.050	56.528
9.077	76.805
9.940	58.065
9.964	98.310
9.965	92.473
9.967	84.485
9.968	75.269
9.999	73.733
10.024	107.527
10.027	92.166
10.029	80.799
10.029	78.955
10.057	95.238
10.058	91.244
10.058	86.943
10.060	78.034
10.120	82.028
10.883	114.900
10.918	85.714
10.946	102.304
10.949	83.564
10.979	88.786
10.983	62.980
11.006	115.207
11.006	112.442
11.039	100.768
11.073	79.570
11.930	95.545
12.021	105.684
12.023	90.323
12.024	81.720
12.050	111.214
12.053	97.081
12.053	91.551
12.116	87.250
12.881	104.455
12.971	114.286
13.001	117.051
13.005	95.853
13.006	89.708
13.032	118.280
13.064	112.750
13.066	98.618
13.067	92.780
13.067	91.859
13.955	109.370
13.984	117.358
13.986	102.611
13.987	100.154
13.988	89.094
14.015	115.822
14.018	98.310
14.019	90.937
14.080	93.395
14.940	93.702
14.998	113.978
15.001	91.551
15.027	123.502
15.062	95.238
15.063	89.401
15.978	129.339
15.983	100.461
16.014	95.545
16.040	123.195
17.027	94.316
17.977	111.828
18.090	172.657
19.084	99.846
20.067	98.003
20.125	120.430
21.077	117.051
25.007	123.502
27.064	126.267
27.154	136.406
28.013	139.478
29.028	130.876];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JensGilr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3MSJQ'; % Cat of Life
metaData.links.id_ITIS = '623484'; % ITIS
metaData.links.id_EoL = '212945'; % Ency of Life
metaData.links.id_Wiki = 'Hucho_taimen'; % Wikipedia
metaData.links.id_ADW = 'Hucho_taimen'; % ADW
metaData.links.id_Taxo = '42802'; % Taxonomicon
metaData.links.id_WoRMS = '1026969'; % WoRMS
metaData.links.id_fishbase = 'Hucho-taimen'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hucho_taimen}}';  
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
bibkey = 'JensGilr2009'; type = 'Article'; bib = [ ... 
'doi = {10.1139/F09-109}, ' ...
'author = {Olaf P. Jensen and David J. Gilroy and Zeb Hogan and Brant C. Allen and Thomas R. Hrabik and Brian C. Weidel and Sudeep Chandra and M. Jake Vander Zanden}, ' ...
'year = {2009}, ' ...
'title = {Evaluating recreational fisheries for an endangered species: a case study of taimen, \emph{Hucho taimen}, in {M}ongolia}, ' ... 
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'pages = {1707–1718}, ' ...
'volume = {66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hucho-taimen.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

