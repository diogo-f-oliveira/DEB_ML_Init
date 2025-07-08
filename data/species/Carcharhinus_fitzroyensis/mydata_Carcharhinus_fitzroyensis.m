function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_fitzroyensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_fitzroyensis'; 
metaData.species_en = 'Creek whaler'; 

metaData.ecoCode.climate = {'MA','Am'};
metaData.ecoCode.ecozone = {'MIE','TA'};
metaData.ecoCode.habitat = {'0iMcp','0iFe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 0.8*365;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'included to check litter interval';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SmarHarr2013';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 50;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
data.Lp  = 89;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 135;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 12.1e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00316*Li^3.09, see F1';

data.Ri  = 5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 7 pups per litter, 1 litter per yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	47.450
0.000	51.910
0.000	59.613
0.000	54.343
0.987	61.673
0.987	65.727
0.987	69.375
1.026	72.620
1.026	75.863
1.026	79.106
1.974	76.706
1.994	79.544
2.013	81.572
2.013	84.005
2.032	88.465
2.032	72.248
2.942	91.333
2.961	84.037
2.961	87.280
2.961	96.199
4.026	100.289
4.026	104.343
4.026	92.181
4.045	95.830
4.955	108.023
4.955	112.077
4.974	104.375
6.000	104.410
6.019	110.897
6.019	113.735
6.987	105.254
6.987	108.092
6.987	110.119
6.987	113.362
7.974	116.638
7.994	110.558
9.000	122.349
9.019	117.079
9.948	119.138
10.974	121.199
11.981	124.071];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'SmarHarr2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	54.746
0.000	47.856
0.000	51.910
0.000	59.613
0.948	72.212
0.968	76.672
1.006	62.890
1.006	67.754
1.006	80.322
1.994	85.220
1.994	86.842
2.032	75.492
2.032	80.762
2.961	81.199
2.961	85.253
2.961	90.118
3.968	83.260
3.968	87.719
3.987	92.990
4.955	86.942
4.955	90.590
4.974	98.294
5.013	95.052
5.981	91.031
5.981	94.679
5.981	97.922
6.039	102.384
7.006	93.498
7.026	99.174
8.032	98.397];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'SmarHarr2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00316 * (TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '68ZKG'; % Cat of Life
metaData.links.id_ITIS = '160380'; % ITIS
metaData.links.id_EoL = '46559803'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_fitzroyensis'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_fitzroyensis'; % ADW
metaData.links.id_Taxo = '106448'; % Taxonomicon
metaData.links.id_WoRMS = '271321'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-fitzroyensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_fitzroyensis}}';
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
bibkey = 'SmarHarr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1002/aqc.2274}, ' ...
'author = {Jonathan J. Smart and Alastair V. Harry and Andrew J. Tobin and Colin A. Simpfendorfer}, ' ... 
'year = {2013}, ' ...
'title = {Overcoming the constraints of low sample sizes to produce age and growth data for rare or threatened sharks}, ' ...
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}, ' ...
'volume = {23}, ' ...
'pages = {124-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-fitzroyensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

