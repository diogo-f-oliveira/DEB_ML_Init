function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_taylori

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_taylori'; 
metaData.species_en = 'Australian sharpnose shark'; 

metaData.ecoCode.climate = {'MB';'MC'};
metaData.ecoCode.ecozone = {'MAW','MAm'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2  = {'Bas Kooijman'};        
metaData.date_mod_2    = [2024 10 26];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data
data.ab = 3*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(26.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'fishbase gives 11-13 mnth, but that is in conflict with very rapid post-natal growth';
data.am = 7*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Simp1993';   
  temp.am = C2K(26.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 24;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Simp1993';  
data.Lp  = 55;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Simp1993'; 
data.Lpm  = 50;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Simp1993'; 
data.Li  = 73.3;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'Simp1993';
data.Lim  = 65.2;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'Simp1993';

data.Wwi = 2.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = {'fishbase','Simp1993'};
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri  = 8/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-10 pups per litter, 1 litter per yr assumed';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	23.522
0.288	44.652
0.298	45.435
0.373	45.696
0.394	49.478
0.448	49.478
0.469	50.130
0.480	47.913
0.512	49.348
0.597	56.261
0.618	55.217
0.757	54.957
0.799	55.087
0.885	62.261
0.895	60.565
0.906	56.783
0.991	66.696
1.012	61.217
1.055	61.609
1.140	63.435
1.151	59.000
1.162	64.870
1.162	57.565
1.172	61.217
1.215	67.217
1.247	64.217
1.417	67.870
1.503	68.391
1.545	66.957
1.545	67.739
1.545	71.391
1.556	61.870
1.567	70.739
1.652	65.000
1.758	69.826
1.769	68.522
1.822	66.174
1.822	64.609
1.865	62.783
1.929	75.304
1.961	69.435
2.131	71.130
2.163	72.565
2.174	69.043
2.174	71.783
2.185	66.826
2.206	70.609
2.227	70.478
2.227	73.087
2.227	74.261
2.238	68.522
2.249	69.304
2.291	71.522
2.291	72.304
2.302	66.304
2.302	69.957
2.409	70.870
2.451	69.957
2.547	73.348
2.568	74.913
2.643	74.261
2.835	70.870
2.899	73.087
2.963	72.304
2.984	69.435
2.995	76.087
3.005	74.130
3.005	67.739
3.016	72.435
3.240	74.522
3.581	74.913
3.591	70.739
3.687	74.652
3.805	72.304
3.901	70.087
4.412	77.913
4.742	72.696
5.169	76.217
5.254	72.565];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(26.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Simp1993';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	24.932
0.321	43.625
0.376	42.821
0.389	45.359
0.556	47.223
0.622	46.953
0.636	50.961
0.660	52.697
0.813	51.888
0.826	53.759
0.915	54.423
1.046	53.214
1.281	57.881
1.404	59.212
1.423	56.271
1.439	62.150
1.446	57.339
1.462	62.817
1.492	59.742
1.547	59.339
1.559	60.808
1.560	61.610
1.599	56.263
1.667	58.131
1.811	59.060
1.935	62.128
2.009	59.452
2.056	62.523
2.057	63.459
2.244	63.718
2.354	63.178
2.431	62.640
2.655	66.906
3.041	67.958
3.060	65.018
3.061	65.819
3.367	63.668
3.609	63.256
3.677	64.990
3.785	62.714
3.907	63.911
3.910	66.717
4.006	64.174
4.790	66.678
5.827	68.903];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(26.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Simp1993';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Lb = 5 * weights.Lb;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

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
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00389 * (TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SDDQ'; % Cat of Life
metaData.links.id_ITIS = '160223'; % ITIS
metaData.links.id_EoL = '46559824'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_taylori'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_taylori'; % ADW
metaData.links.id_Taxo = '106462'; % Taxonomicon
metaData.links.id_WoRMS = '271329'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-taylori'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_taylori}}';
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
bibkey = 'Simp1993'; type = 'article'; bib = [ ... 
'author = {Colin A. Simpfendorfer}, ' ... 
'year = {1993}, ' ...
'title = {Age and growth of the {A}ustralian sharpnose shark, \emph{Rhizoprionodon taylori}, from north {Q}ueensland, {A}ustralia}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {36}, ' ...
'pages = {233-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhizoprionodon-taylori.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

