function [data, auxData, metaData, txtData, weights] = mydata_Raja_texana

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_texana'; 
metaData.species_en = 'Roundel skate'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAg'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 4.5*30.5;units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(24.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SuliIrvi2007';   
  temp.am = C2K(24.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 11.4; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SuliIrvi2007';
data.Lp  = 44.4; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SuliIrvi2007';
data.Lpm = 53.7;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'SuliIrvi2007';
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SuliIrvi2007';

data.Wwi = 2.73e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00275*Li^3.25, see F1';

data.Ri  = 20/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on other Raja species';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.942	30.258
1.957	28.846
1.973	31.199
1.974	33.788
2.005	33.082
2.946	33.917
2.963	37.093
2.964	38.976
2.965	40.387
2.992	30.623
2.993	32.152
2.993	33.211
2.997	41.447
3.010	36.035
3.927	52.987
3.951	37.693
3.951	38.517
3.969	41.693
3.970	44.635
3.970	45.105
3.970	45.811
3.985	44.282
3.987	46.752
3.989	51.929
4.003	47.576
4.003	47.929
4.003	48.400
4.003	49.106
4.004	49.811
4.004	50.988
4.016	43.106
4.924	40.646
4.960	51.470
4.975	49.823
4.976	50.764
4.977	52.999
4.977	53.823
4.990	48.529
5.006	49.353
5.951	57.481
5.967	58.540
5.978	48.893
5.982	56.776
5.995	51.835
5.996	53.011
5.996	53.600
5.996	54.070
5.996	54.776
5.997	55.835
6.053	40.777
6.968	53.376
6.968	54.317
6.968	55.023
6.985	56.905
6.985	58.082
6.986	58.670
6.986	59.141
6.986	59.964
6.998	51.964
7.974	60.682
8.003	56.211
8.004	57.035
8.004	57.976
8.991	57.282
8.992	59.635
8.993	61.400
8.994	63.400
9.023	58.459];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(24.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SuliIrvi2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.944	36.023
1.958	31.905
1.960	37.317
1.987	27.435
1.989	30.611
1.989	30.964
2.932	37.799
2.945	30.270
2.949	40.858
2.964	39.093
2.965	40.035
2.993	32.976
2.993	33.564
2.994	34.858
2.994	35.447
2.994	36.270
3.938	44.281
3.966	35.811
3.983	38.988
3.985	42.517
3.985	43.223
3.986	45.105
3.999	39.811
3.999	40.517
4.016	41.694
4.958	45.117
4.973	44.293
4.974	46.529
4.974	47.117
4.986	38.882
4.987	40.294
4.987	41.705
4.988	42.764
4.988	43.470
5.977	46.658
5.977	47.482
5.992	45.364
5.993	47.952
5.994	49.717
6.007	44.541
6.980	45.729
6.980	46.552
6.982	50.317
7.012	47.494
7.013	49.259
7.028	48.435
7.983	47.035
7.984	48.094];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(24.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SuliIrvi2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00275 * (TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6X3CK'; % Cat of Life
metaData.links.id_ITIS = '160875'; % ITIS
metaData.links.id_EoL = '46560571'; % Ency of Life
metaData.links.id_Wiki = 'Raja_texana'; % Wikipedia
metaData.links.id_ADW = 'Raja_texana'; % ADW
metaData.links.id_Taxo = '152905'; % Taxonomicon
metaData.links.id_WoRMS = '271584'; % WoRMS
metaData.links.id_fishbase = 'Raja-texana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rostroraja_texana}}'; 
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
bibkey = 'SuliIrvi2007'; type = 'Article'; bib = [ ...  
'author = {James A. Sulikowski and Sarah B. Irvine and Kate C. DeValerio and John K. Carlson}, ' ...
'year = {2007}, ' ...
'title  = {Age, growth and maturity of the roundel skate, \emph{Raja texana}, from the {G}ulf of {M}exico, {U}{S}{A}}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58}, ' ...
'pages = {41-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Raja-texana.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  