function [data, auxData, metaData, txtData, weights] = mydata_Neoscorpis_lithophilus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Kyphosidae';
metaData.species    = 'Neoscorpis_lithophilus'; 
metaData.species_en = 'Stone-bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 12];

%% set data
% zero-variate data

data.am = 11*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MannFenn2002';   
  temp.am = C2K(21.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 to 1.4 mm: pi/6*0.1^3';
data.Wwp = 464;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01660*Lp^3.01, see F1';
data.Wwi = 2158;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.01660*Li^3.01, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Scorpis_lineolata';
 
% uni-variate data

% time-length
data.tL = [ ... % time since hatch (d), fork length (cm)
0.903	15.930
0.933	16.740
0.949	10.890
0.949	13.050
0.964	14.490
0.964	15.210
0.964	15.840
0.964	17.640
0.979	11.520
0.994	13.680
0.994	17.190
1.010	14.850
1.974	21.510
1.974	19.980
1.989	19.080
1.989	17.010
1.989	14.940
2.004	20.790
2.019	25.200
2.019	18.810
2.019	17.820
2.019	16.110
2.019	15.660
2.035	14.760
2.050	23.310
2.050	18.540
2.922	20.340
2.968	25.650
2.983	26.640
2.983	27.000
2.983	28.620
2.999	16.920
2.999	21.060
2.999	28.080
2.999	29.250
3.014	22.860
3.014	23.940
3.014	23.940
3.014	24.570
3.029	23.670
3.029	24.480
3.045	21.960
3.045	26.010
3.060	26.100
3.871	26.280
3.886	25.920
3.917	28.350
3.932	29.790
3.932	25.290
3.947	32.220
3.947	27.360
3.947	26.730
3.993	30.870
3.993	29.250
3.993	27.720
3.993	27.540
3.993	28.350
3.993	24.570
4.024	31.590
4.024	29.520
4.024	27.720
4.024	20.880
4.911	30.780
4.911	31.500
4.942	34.200
4.942	33.030
4.957	30.510
4.957	32.040
4.972	38.070
5.003	24.930
5.003	27.270
5.003	29.250
5.018	26.010
5.018	26.820
5.018	27.900
5.018	32.580
5.018	35.460
5.033	30.780
5.033	31.770
5.033	34.200
5.049	28.710
5.049	31.410
5.049	29.610
5.079	32.220
5.079	33.390
5.936	31.950
5.951	37.260
5.951	36.720
5.951	36.180
5.967	37.710
5.967	35.730
5.967	35.460
5.967	34.920
5.967	33.660
5.967	33.570
5.967	33.120
5.967	33.120
5.967	32.850
5.967	30.960
5.967	29.250
5.982	31.230
5.982	30.600
5.997	31.680
5.997	27.990
6.013	38.430
6.013	31.770
6.028	34.380
6.028	29.700
6.043	32.580
6.976	31.140
6.976	31.950
6.992	37.800
7.007	24.120
7.007	28.980
7.007	35.100
7.007	39.870
7.022	35.910
7.022	36.090
7.022	36.630
7.038	32.760
7.038	33.750
7.038	34.110
7.038	34.110
7.971	39.510
8.001	38.070
8.001	35.370
8.001	35.010
8.001	34.740
8.001	34.020
8.001	33.300
8.017	38.880
8.017	36.810
8.017	32.760
8.032	27.450
8.935	34.290
8.981	37.260
8.981	40.140
8.996	38.070
8.996	39.150
9.057	42.210
10.021	36.810
10.021	37.170
10.021	38.250
10.051	36.000];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
n=size(data.tL,1); for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(21.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MannFenn2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46SSC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578628'; % Ency of Life
metaData.links.id_Wiki = 'Neoscorpis_lithophilus'; % Wikipedia
metaData.links.id_ADW = 'Neoscorpis_lithophilus'; % ADW
metaData.links.id_Taxo = '181216'; % Taxonomicon
metaData.links.id_WoRMS = '218709'; % WoRMS
metaData.links.id_fishbase = 'Neoscorpis-lithophilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neoscorpis_lithophilus}}';
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
bibkey = 'MannFenn2002'; type = 'Article'; bib = [ ... 
'author = {PBruce Q. Mann and Sean T. Fennessy and Anesh Govender and Bryan A. van der Walt}, ' ... 
'year = {2002}, ' ...
'title = {Age and growth and a preliminary stock assessment of stonebream \emph{Neoscorpis lithophilus} ({P}isces : {S}corpididae) along the {K}waZulu-{N}atal coast, {S}outh {A}frica}, ' ...
'journal = {Mar. Freshwater Res.}, ' ...
'volume = {53}, ' ...
'pages = {131–138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Neoscorpis-lithophilus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

