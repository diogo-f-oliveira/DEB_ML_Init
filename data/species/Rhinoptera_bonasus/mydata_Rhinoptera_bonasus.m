function [data, auxData, metaData, txtData, weights] = mydata_Rhinoptera_bonasus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Rhinoptera_bonasus'; 
metaData.species_en = 'Cownose ray'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 25]; 

%% set data
% zero-variate data;
data.ab = 365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 26*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Neer2005';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 40;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'Neer2005';
data.Lp = 65.3;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 120;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 

data.Wwi  = 8.3e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Neer2005'; 

data.Ri  = 1/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Neer2005';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.000	35.021
0.000	47.124
0.000	52.275
0.026	43.519
0.026	41.974
0.053	39.399
0.923	54.592
0.950	46.094
0.950	40.429
0.950	39.142
1.953	45.064
1.953	49.700
1.953	55.622
1.953	57.425
2.005	43.777
2.955	72.361
2.955	73.391
2.982	60.258
2.982	61.803
2.982	64.893
3.008	50.987
3.958	71.588
3.958	67.725
4.011	59.742
4.011	61.288
4.987	51.502
4.987	62.318
5.013	61.803
5.013	74.421
5.963	81.631
6.966	72.361
6.966	68.498
7.018	70.558
8.945	84.979
8.945	83.691
8.945	81.631
8.971	95.279
8.971	80.343
9.024	99.657
9.024	78.798
9.947	78.283
9.947	80.086
9.974	82.661
9.974	92.961
9.974	97.339
10.000	100.172
10.026	86.009
11.003	90.901
11.979	97.339
11.979	88.069
11.979	87.296
12.005	99.657
12.929	83.176
12.929	90.644
12.955	101.974
12.955	103.004
12.982	97.339
14.934	91.931
14.934	99.914
14.934	101.717
16.016	100.172
16.992	102.232
17.968	102.232];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(26.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Neer2005';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.026	33.734
0.026	36.052
0.026	38.112
0.026	39.914
0.026	41.717
0.026	49.442
0.053	43.777
0.053	45.322
0.053	46.867
0.053	48.155
1.003	53.562
1.003	51.245
1.003	49.185
1.003	47.897
1.003	46.609
1.003	44.292
1.003	42.489
1.003	41.717
1.003	40.687
1.926	54.335
1.926	53.047
1.953	51.245
2.005	64.120
2.005	59.742
2.005	58.970
2.005	49.957
2.005	46.609
2.982	57.682
3.008	54.077
3.008	75.451
3.034	52.017
3.984	55.622
3.984	57.940
3.984	62.318
4.960	58.712
5.013	67.468
5.013	69.013
5.013	70.558
5.013	71.845
5.040	64.120
5.937	69.528
5.937	67.210
5.963	70.300
6.016	73.133
6.992	73.906
6.992	91.931
7.018	64.120
7.018	66.180
7.018	69.270
7.018	75.451
7.942	91.674
7.995	81.631
7.995	79.056
7.995	77.768
7.995	74.936
7.995	73.648
8.021	86.266
8.021	72.361
8.918	73.648
8.945	75.193
8.997	89.099
8.997	90.386
10.000	73.133
10.000	77.253
10.000	88.326
10.026	84.979
10.026	85.751
10.950	75.966
10.950	78.026
10.950	87.039
10.950	88.326
11.003	92.704
11.003	94.764
12.032	95.536
12.032	93.991
12.955	91.674
12.955	93.219
12.955	94.506
12.955	95.794
13.984	92.189
14.037	94.506
15.040	95.536
16.016	93.991
17.968	102.232];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(26.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Neer2005';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S9R4'; % Cat of Life
metaData.links.id_ITIS = '160985'; % ITIS
metaData.links.id_EoL = '46560999'; % Ency of Life
metaData.links.id_Wiki = 'Rhinoptera_bonasus'; % Wikipedia
metaData.links.id_ADW = 'Rhinoptera_bonasus'; % ADW
metaData.links.id_Taxo = '42166'; % Taxonomicon
metaData.links.id_WoRMS = '158544'; % WoRMS
metaData.links.id_fishbase = 'Rhinoptera-bonasus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinoptera_bonasus}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhinoptera-bonasus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Neer2005'; type = 'phdthesis'; bib = [ ...  
'author = {Julie Ann Neer}, ' ...
'title = {Aspects of the life history, ecophysiology, bioenergetics, and population dynamics of the cownose ray, \emph{Rhinoptera bonasus}, in the northern {G}ulf of {M}exico}, ' ...
'year = {2005}, ' ...
'school = {Louisiana State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
