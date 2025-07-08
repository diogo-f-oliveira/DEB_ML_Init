function [data, auxData, metaData, txtData, weights] = mydata_Anodontites_trapesialis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Mycetopodidae';
metaData.species    = 'Anodontites_trapesialis'; 
metaData.species_en = 'Freshwater clam'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 08]; 

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'CallLeit2018';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CallLeit2018';
  comment.Lp = '2.0 till 2.3 cm ';
data.Li  = 16;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'CallLeit2018';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
data.Wwi = 390; units.Wwi = 'g';   label.Wwi = 'total wet weight';   bibkey.Wwi = 'CallLeit2018';  
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.000	0.410
0.000	1.548
0.000	1.710
0.000	2.076
0.000	2.158
0.000	2.524
0.000	0.572
0.000	0.776
0.018	2.280
0.018	2.442
0.997	2.449
0.997	2.612
0.997	2.693
0.997	2.896
0.997	2.937
0.998	3.140
0.998	3.221
0.998	3.384
0.998	3.465
0.999	4.400
1.013	3.628
1.026	1.880
1.027	2.205
1.029	3.913
1.029	3.994
2.007	3.269
2.007	3.879
2.007	4.082
2.009	5.586
2.011	7.334
2.024	5.383
2.038	4.936
2.039	5.261
2.986	4.454
2.987	4.698
2.987	4.820
2.987	4.983
2.987	5.267
2.988	5.674
2.988	6.121
2.988	6.243
2.989	6.568
2.989	6.731
2.989	6.812
2.989	6.975
2.989	7.219
2.989	7.503
2.990	7.625
3.005	7.910
3.005	7.991
3.005	8.276
3.006	8.642
3.036	8.723
4.935	10.362
4.980	10.200
4.994	9.956
5.009	9.671
5.009	9.712
5.022	7.273
5.022	7.639
5.023	8.045
5.023	8.249
5.023	8.533
5.023	8.696
5.023	8.777
5.024	8.940
5.024	9.102
5.024	9.184
5.024	9.346
5.024	9.549
5.040	10.728
5.041	11.379
5.042	12.354
5.973	9.556
5.973	9.962
5.973	10.288
5.974	10.410
5.974	10.613
5.974	10.857
5.974	10.938
5.974	11.101
5.974	11.263
5.975	11.385
5.975	11.588
5.975	11.914
5.975	12.036
5.976	12.442
5.977	13.906
5.991	12.808
5.992	13.540
6.001	7.808
6.001	7.930
6.001	8.133
6.002	8.377
6.002	8.784
6.996	9.400
6.997	9.685
7.000	13.018
7.027	10.051
7.029	11.474
7.029	11.636
7.029	11.799
7.029	11.961
7.029	12.205
7.030	12.409
7.030	12.571
7.031	13.466
7.031	13.587
7.031	13.994
7.044	11.352
7.058	10.295
7.058	10.458
7.058	10.539
7.058	10.742
7.058	10.905
7.058	11.149
7.980	14.610
7.980	14.610
7.991	10.220
7.992	10.992
7.992	11.074
7.993	12.171
7.995	13.757
8.008	11.846
8.010	14.488
8.023	11.846
8.024	13.106
8.024	13.513
8.025	14.123
8.025	14.285
8.026	14.895
8.987	12.950
9.016	11.853
9.019	14.455
9.019	14.699
10.030	16.128];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CallLeit2018';
comment.tL = 'Data for Pantanal, Brazil';

% legnth-fecundity
data.LN = [ ... % shell length (cm), fecundity (#)
6.539	530612.245
7.419	1959183.673
7.419	1673469.388
7.457	897959.184
7.648	2163265.306
7.878	979591.837
8.107	1632653.061
8.413	693877.551
8.451	2489795.918
8.489	2204081.633
8.757	2571428.571
8.872	1714285.714
8.910	530612.245
9.101	2285714.286
9.331	1918367.347
9.446	3428571.429
9.484	3102040.816
9.522	2489795.918
9.713	2163265.306
10.019	6489795.918
10.019	40816.327
10.172	2326530.612
10.249	2653061.224
10.325	3346938.776
10.707	897959.184
10.707	1918367.347
10.746	4040816.327
10.937	81632.653
11.052	3061224.490
11.281	530612.245
11.434	3346938.776
11.587	3020408.163
11.702	6408163.265
12.008	612244.898
12.084	3102040.816
12.428	3918367.347
13.117	6530612.245
13.384	3591836.735
13.881	5755102.041
14.417	7020408.163
14.799	11061224.490
15.985	6204081.633];
units.LN   = {'cm', '#'};  label.LN = {'shell length','fecundity'};  
temp.LN    = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CallLeit2018';
comment.LN = 'Data for Pantanal, Brazil';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '675VF'; % Cat of Life
metaData.links.id_ITIS = '983982'; % ITIS
metaData.links.id_EoL = '47415829'; % Ency of Life
metaData.links.id_Wiki = 'Anodontites'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '652751'; % Taxonomicon
metaData.links.id_WoRMS = '1324136'; % WoRMS
metaData.links.id_molluscabase = '1324136'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anodontites_trapesialis}}';
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
bibkey = 'CallLeit2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10750-017-3097-3}, ' ...
'author = {Cl\''{a}udia T. Callil and Marilene C. S. Leite  and L\''{u}cia A. F. Mateus and Jess W. Jones}, ' ... 
'year = {2018}, ' ...
'title = {Influence of the flood pulse on reproduction and growth of \emph{Anodontites trapesialis} ({L}amarck, 1819) ({B}ivalvia: {M}ycetopodidae) in the {P}antanal wetland, {B}razil}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {810}, ' ...
'pages = {433-448}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
