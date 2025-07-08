function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_lalandii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_lalandii'; 
metaData.species_en = 'Brazilian sharpnose shark'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 02];              
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
data.ab = 6.5*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'CorsGadi1993';   
  temp.am = C2K(27.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 35;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'CorsGadi1993';  
data.Lp  = 62;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'CorsGadi1993'; 
data.Lpm  = 59;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'CorsGadi1993'; 
data.Li  = 75.2;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'CorsGadi1993';
data.Lim  = 66.2;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'CorsGadi1993';

data.Wwi = 2.95e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'EoL';
  comment.Wwi = 'based on 0.00269*Li^3.08, of F1 gives 1.6 kg';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter, 1 litter per yr assumed';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.017	33.760
0.017	34.318
0.017	34.875
0.000	32.507
0.000	33.203
0.034	31.671
0.034	35.571
0.034	36.267
0.034	36.546
0.034	37.103
0.034	40.028
0.068	38.635
1.041	61.616
1.041	63.148
1.058	60.501
1.996	64.958
2.013	62.033
2.013	66.769
2.013	69.972
2.030	62.451
2.030	63.008
2.030	63.705
2.030	64.123
2.985	70.529
3.036	66.072
3.036	67.047
3.036	68.997
4.060	68.162
4.060	69.276
4.060	71.922
5.015	72.061
5.015	72.897
5.015	73.593
5.015	74.429
5.970	75.682
5.987	74.011
5.987	74.708
6.021	72.201
6.021	73.175
6.994	76.797
6.994	78.886
7.028	75.404
7.966	77.493];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CorsGadi1993';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.009	33.429
0.009	34.000
0.009	34.686
0.000	30.914
0.000	31.257
0.000	32.629
0.000	35.600
0.000	36.171
0.000	36.857
0.000	37.429
0.991	54.571
0.991	57.086
0.991	57.314
0.991	58.114
0.991	59.257
0.991	60.057
0.991	60.743
1.000	58.571
2.000	60.171
2.000	60.743
2.000	61.429
2.000	61.886
2.000	62.343
2.000	62.914
2.009	66.000
2.009	67.257
2.974	62.229
2.974	62.914
2.974	63.486
2.974	63.829
2.983	65.086
2.983	65.657
2.983	66.000
2.991	59.486
2.991	66.571
3.000	67.143
3.991	66.000
3.991	66.343
3.991	67.143
3.991	69.429
4.017	68.057];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'CorsGadi1993';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 15 * weights.tL_f;
weights.tL_m = 15 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'The high value for [p_M] results from the surprisingly fast growth.';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00269 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6X78K'; % Cat of Life
metaData.links.id_ITIS = '160203'; % ITIS
metaData.links.id_EoL = '46559821'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_lalandii'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_lalandii'; % ADW
metaData.links.id_Taxo = '106458'; % Taxonomicon
metaData.links.id_WoRMS = '271326'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-lalandii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_lalandii}}';
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
bibkey = 'CorsGadi1993'; type = 'article'; bib = [ ... 
'doi = {10.1071/MF19379}, ' ...
'author = {J\''{e}ssica T. Corsso and Otto B. F. Gadig and Fabio P. Caltabellotta and Rodrigo Barreto and Fabio S. Motta}, ' ... 
'year = {1993}, ' ...
'title = {Age and growth of two sharpnose shark species (\emph{Rhizoprionodon lalandii} and \emph{R. porosus}) in subtropical waters of the south-western {A}tlantic}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {36}, ' ...
'pages = {233-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhizoprionodon-lalandii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559821}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

