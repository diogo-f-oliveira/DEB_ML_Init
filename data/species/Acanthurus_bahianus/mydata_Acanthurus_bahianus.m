function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_bahianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_bahianus'; 
metaData.species_en = 'Barber surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 03];

%% set data
% zero-variate data

data.am = 32*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'RobeAcke2005';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 17;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'RobeAcke2005';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tuck1998';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 8.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01950*Lp^2.92, see F1';
data.Wwi = 76.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','RobeAcke2005'};
  comment.Wwi = 'based on 0.01950*Li^2.92, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(28); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
0.221	6.818
0.286	2.432
0.291	6.300
0.360	5.183
0.432	5.901
0.929	8.133
0.967	9.927
1.003	10.286
1.005	12.120
1.006	12.399
1.007	13.436
1.008	14.393
1.034	7.615
1.035	7.774
1.043	13.994
1.046	16.267
1.071	8.532
1.075	11.721
1.076	12.599
1.077	13.077
1.929	16.425
1.930	17.263
1.960	13.435
1.961	15.628
1.962	15.987
1.963	16.066
1.994	12.877
1.996	13.913
2.027	11.202
2.030	13.036
2.035	17.023
2.037	17.980
2.039	19.894
2.061	10.245
2.062	10.604
2.063	10.883
2.064	11.481
2.065	13.235
2.068	15.069
2.102	14.152
2.103	14.790
2.981	12.477
3.021	15.547
3.053	13.473
3.056	15.188
3.057	15.906
3.058	17.022
3.088	13.274
3.090	14.630
3.093	16.583
3.097	19.335
3.124	13.713
3.125	14.311
3.128	16.145
3.165	17.500
4.009	15.665
4.042	13.871
4.078	14.509
4.084	18.616
4.086	19.812
4.148	14.270
4.155	18.855
4.156	19.054
4.188	17.499
4.995	14.269
4.996	14.628
4.997	14.827
5.032	15.545
5.036	17.937
5.042	22.642
5.068	15.903
5.069	16.541
5.170	12.953
5.949	15.424
6.022	16.620
6.058	17.537
6.125	15.065
6.127	16.221
6.973	15.941
7.008	15.582
7.011	17.337
7.117	17.974
8.032	16.378
8.071	18.571
8.072	18.851
8.102	15.581
8.990	19.767
9.028	21.959
9.029	22.597
10.007	15.898
10.046	17.851
12.025	20.600
12.060	20.082
12.971	15.934
13.006	15.376
13.041	15.655
13.042	16.213
13.044	17.449
14.033	18.006
14.072	20.917
15.017	15.693
15.019	17.008
15.055	17.726
15.056	18.005
15.088	15.932
15.091	17.606
15.125	17.327
16.042	16.928
17.064	16.288
17.067	17.764
17.985	18.520
18.016	15.171
18.052	16.247
18.055	18.201
18.088	16.726
20.029	16.524
20.066	17.920
20.171	17.122
20.946	16.603
21.017	16.882
21.018	17.161
22.922	16.601
23.066	18.435
23.979	15.762
23.980	16.639
23.981	17.397
24.020	19.630
24.050	16.201
24.085	16.440
24.086	16.879
24.087	17.078
25.003	16.160
25.036	14.964
25.037	15.442
26.063	17.594
26.947	18.630
27.013	15.719
27.014	16.317
27.052	18.031
27.086	16.915
27.969	17.791
28.110	18.070
28.111	18.788
28.145	17.352
28.146	17.592
29.026	16.594
30.013	16.553
32.062	17.866];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RobeAcke2005'; comment.tL = 'Data from Bermuda';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.01950*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '92LV'; % Cat of Life
metaData.links.id_ITIS = '172252'; % ITIS
metaData.links.id_EoL = '46577046'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_bahianus'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_bahianus'; % ADW
metaData.links.id_Taxo = '159943'; % Taxonomicon
metaData.links.id_WoRMS = '159578'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-bahianus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_lineatus}}';
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
bibkey = 'RobeAcke2005'; type = 'Article'; bib = [ ... 
'author = {Robertson, D.R. and J.L. Ackerman and J.H. Choat and J.M. Posada and J. Pitt}, ' ... 
'year = {2005}, ' ...
'title = {Ocean surgeonfish \emph{Acanthurus bahianus}. {I}. {T}he geography of demography}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {295}, ' ...
'pages = {229-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1258}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck1998'; type = 'Book'; bib = [ ...  
'author = {Tucker, J. W.}, ' ...
'year = {1998}, ' ...
'title  = {Marine Fish Culture}, ' ...
'publisher = {Springer-Science+Business Media}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
