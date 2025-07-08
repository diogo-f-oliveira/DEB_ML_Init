function [data, auxData, metaData, txtData, weights] = mydata_Myoxocephalus_polyacanthocephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Myoxocephalus_polyacanthocephalus'; 
metaData.species_en = 'Great sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 15];

%% set data
% zero-variate data

data.am = 17 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(3.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 56;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 80;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 7.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.4 mm of Myoxocephalus_scorpius: pi/6*0.24^3';
data.Wwp = 1892;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00589*Lp^3.15, see F1';
data.Wwi = 5819;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00589*Li^3.15, see F1;max. published weight: 9.0 kg';

data.Ri = 159000/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(3.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (yr), total length (cm) 
2.007	18.239
2.905	31.325
2.930	24.870
2.976	25.792
2.976	24.501
2.977	23.763
2.997	35.013
2.997	33.907
2.999	27.820
3.044	29.664
3.091	28.188
3.091	26.344
3.966	40.906
3.968	35.926
3.968	35.189
3.969	31.500
3.969	30.394
3.969	28.734
3.990	38.693
3.990	38.139
3.990	37.586
3.991	33.897
3.992	32.975
4.036	39.614
4.058	44.409
4.960	42.372
4.961	39.790
4.963	32.966
4.984	40.528
4.984	39.052
5.031	38.130
5.031	37.945
5.073	51.777
5.074	48.088
5.078	35.732
5.932	41.072
5.951	57.486
5.998	51.953
5.999	49.740
5.999	49.371
5.999	48.080
6.021	54.719
6.021	53.612
6.021	52.690
6.021	52.690
6.021	51.399
6.023	45.498
6.023	43.838
6.042	61.358
6.043	58.592
6.046	46.788
6.921	60.428
6.946	51.206
6.948	45.489
6.968	58.583
6.968	57.292
6.968	55.263
6.970	48.993
6.989	63.931
6.990	62.640
6.992	53.788
6.992	53.234
7.015	52.681
7.061	56.369
7.061	54.340
7.961	60.787
7.964	48.615
7.984	61.709
7.986	54.147
8.008	59.680
8.029	66.504
8.031	58.758
8.031	58.020
8.032	55.438
8.053	62.815
8.861	67.787
8.884	69.262
8.885	65.020
8.908	67.049
8.932	63.360
8.955	62.622
8.955	62.069
8.956	60.409
8.976	70.737
9.002	60.777
9.047	65.941
9.051	50.080
9.969	75.154
9.970	72.387
9.970	71.465
9.971	68.883
9.993	70.358
9.995	64.272
9.995	63.535
10.016	73.493
10.017	69.805
10.017	68.145
10.018	66.854
10.018	65.932
10.020	57.448
10.043	58.186
10.944	59.837
10.987	74.038
10.987	71.825
10.988	70.534
10.988	68.689
10.989	65.923
11.013	63.525
11.033	72.746
11.035	67.582
11.888	74.583
11.936	69.050
11.937	64.439
11.957	76.611
11.982	72.000
12.951	77.893
12.952	74.204
12.953	72.360
12.956	58.528
12.976	70.884
13.992	76.961
14.039	71.797
14.917	74.924
14.963	77.690
15.057	69.390
15.911	77.865
15.959	70.857];
data.tL_f(:,1) =  365* (0 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(3.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrogAnde2012';
%
data.tL_m = [ ... % age (yr), total length (cm) 
2.052	21.374
2.882	32.063
2.908	19.153
2.927	36.305
2.953	26.899
2.954	21.550
2.975	29.112
2.976	24.132
3.000	22.657
3.045	25.791
3.898	35.558
3.945	34.820
3.966	42.381
3.969	32.053
3.991	36.479
4.016	27.442
4.061	30.762
4.107	34.265
4.939	36.102
4.960	44.770
4.983	43.294
4.986	30.384
5.031	35.179
5.055	33.519
5.123	37.760
5.978	39.781
6.001	42.362
6.970	48.993
6.970	47.702
6.995	41.062
7.018	42.906
7.989	44.004
8.056	50.827
8.057	48.245
8.960	41.597
8.981	51.741
8.982	46.577
9.005	48.605
9.005	47.683
9.006	45.286
9.006	44.732
9.027	53.953
9.930	48.043
9.974	55.605
9.998	53.760
9.999	48.781
10.970	50.985
10.971	47.296
10.992	54.489
10.992	53.198
10.993	48.034
11.016	49.509
11.987	52.266
12.935	49.860
12.957	52.995
12.958	51.704
13.951	54.092
15.038	53.898];
data.tL_m(:,1) =  365 * (0 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(3.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrogAnde2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.15'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '456LN'; % Cat of Life
metaData.links.id_ITIS = '167320'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myoxocephalus_octodecemspinosus'; % Wikipedia
metaData.links.id_ADW = 'Myoxocephalus_octodecemspinosus'; % ADW
metaData.links.id_Taxo = '180580'; % Taxonomicon
metaData.links.id_WoRMS = '159520'; % WoRMS
metaData.links.id_fishbase = 'Myoxocephalus-octodecemspinosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myoxocephalus_octodecemspinosus}}';
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
bibkey = 'BrogAnde2012'; type = 'techreport'; bib = [ ... 
'author = {Brogan, J. D. and D. M. Ander}, ' ... 
'year = {2012}, ' ...
'title = {Great sculpin (\emph{Myoxocephalus polyacanthocephalus})}, ' ...
'institution = {Resource Ecology and Fisheries Management Division, Alaska Fisheries Science Center, NMFS, NOAA, 7600 Sand Point Way NE, Seattle WA 98115}, ' ...
'howpublished = {\url{https://www.fisheries.noaa.gov/alaska/science-data/great-sculpin-myoxocephalus-polyacanthocephalus-age-and-growth-research}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myoxocephalus_octodecemspinosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

