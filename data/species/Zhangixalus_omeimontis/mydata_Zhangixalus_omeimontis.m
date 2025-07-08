function [data, auxData, metaData, txtData, weights] = mydata_Zhangixalus_omeimontis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Zhangixalus_omeimontis'; 
metaData.species_en = 'Omei whipping frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 13.9;     units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'LiaoLiao2010';   
  temp.ab = C2K(10.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-17 d';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Lj = 1.8;   units.Lj = 'cm'; label.Lj = 'SVL at metam';                    bibkey.Lj  = 'LiaoLu2011';
data.Lp  = 5.5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';               bibkey.Lp  = 'LiaoLu2011';
data.Li  = 8.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                 bibkey.Li  = 'LiaoLu2011';
data.Lim  = 7;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';                bibkey.Lim = 'LiaoLu2011';

data.Wwb = 0.0172; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'LiaoLiao2010';
  comment.Wwb = 'based on egg diameter 2.9-3.4 mm: pi/6*0.32^3';
data.Wwi = 23.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li and L-Ww relationship of Hyla arborea: (8.5/5)^3*4.8';

data.Ri  = 650/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate'; bibkey.Ri  = 'LiaoLiao2010';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '457 to 837  eggs per clutch, 1 clutch per season';
 
% uni-variate data
% time-length
data.tL_Hfm = [ ... % time since metam (d), SVL (cm)
0.3	1.805 1.829
2	5.901 6.069
2   NaN   5.852
2   NaN   5.491
3	7.491 6.721
3	7.299 6.529
3	7.106 6.264
3   NaN   6.047
4	7.469 6.820
4	7.253 6.435
4	7.638 6.290
4	7.782 6.098
4	7.927 NaN
4	8.095 NaN
5	7.833 6.822
5	7.520 6.630
5	8.049 6.461
5   NaN   7.039
5   NaN   6.341
6	8.076 6.969
6	8.220 6.800
6	7.956 6.512
8	8.177 NaN]; 
data.tL_Hfm(:,1) = data.tL_Hfm(:,1) * 365; % convert yr to d
units.tL_Hfm   = {'d', 'cm'};  label.tL_Hfm = {'time since metam', 'SVL'};  
temp.tL_Hfm    = C2K(8);  units.temp.tL_Hfm = 'K'; label.temp.tL_Hfm = 'temperature';
bibkey.tL_Hfm  = 'LiaoLu2011'; treat.tL_Hfm = {1,{'females','males'}}; 
comment.tL_Hfm = '1690 m alt, Baoxing County of Sichuan province in western China';
%
data.tL_Mfm = [ ... % time since metam (d), SVL (cm)
0.3 1.777 1.777
2 	7.301 6.269
2   NaN   5.957
2   NaN   6.053
2   NaN   6.221
3 	7.639 6.535
3 	7.519 6.151
3   NaN   6.415
4 	7.786 6.466
4   NaN   6.658
5 	7.884 6.684]; 
data.tL_Mfm(:,1) = data.tL_Mfm(:,1) * 365; % convert yr to d
units.tL_Mfm   = {'d', 'cm'};  label.tL_Mfm = {'time since metam', 'SVL'};  
temp.tL_Mfm    = C2K(10);  units.temp.tL_Mfm = 'K'; label.temp.tL_Mfm = 'temperature';
bibkey.tL_Mfm  = 'LiaoLu2011'; treat.tL_Mfm = {1,{'females','males'}}; 
comment.tL_Mfm = '1000 m alt, Baoxing County of Sichuan province in western China';
%
data.tL_Lfm = [ ... % time since metam (d), SVL (cm)
0.3	1.796 1.772
0.5	NaN   4.125
1   NaN   5.388
1   NaN   6.116
1   NaN   5.267
1   NaN   5.558
1   NaN   5.679
2	7.428 5.681
2   NaN   5.973
2   NaN   6.045
2   NaN   6.191
2   NaN   6.361
3	7.430 6.412
3	7.649 6.266
4	7.700 6.462
4   NaN   6.535
5	7.799 NaN]; 
data.tL_Lfm(:,1) = data.tL_Lfm(:,1) * 365; % convert yr to d
units.tL_Lfm   = {'d', 'cm'};  label.tL_Lfm = {'time since metam', 'SVL'};  
temp.tL_Lfm    = C2K(12);  units.temp.tL_Lfm = 'K'; label.temp.tL_Lfm = 'temperature';
bibkey.tL_Lfm  = 'LiaoLu2011'; treat.tL_Lfm = {1,{'females','males'}}; 
comment.tL_Lfm = '760 m alt, Baoxing County of Sichuan province in western China';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Makes foam nest in tree above water';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5D4ML'; % Cat of Life
metaData.links.id_ITIS = '1102413'; % ITIS
metaData.links.id_EoL = '60189272'; % Ency of Life
metaData.links.id_Wiki = 'Zhangixalus_omeimontis'; % Wikipedia
metaData.links.id_ADW = 'Zhangixalus_omeimontis'; % ADW
metaData.links.id_Taxo = '5741654'; % Taxonomicon
metaData.links.id_WoRMS = '1421918'; % WoRMS
metaData.links.id_amphweb = 'Zhangixalus+omeimontis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zhangixalus_omeimontis}}';
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
bibkey = 'LiaoLu2011'; type = 'Article'; bib = [ ... 
'author = {W.B. Liao and X. Lu}, ' ... 
'year = {2011}, ' ...
'title = {Variation in body size, age and growth in the {O}mei treefrog (\emph{Rhacophorus omeimontis}) along an altitudinal gradient in western {C}hina}, ' ...
'journal = {Ethology Ecology \& Evolution}, ' ...
'volume = {23}, ' ...
'pages = {248–261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiaoLiao2010'; type = 'Article'; bib = [ ... 
'author = {W.B. Liao and X. Lu Wen Bo Liao and Xin Lu}, ' ... 
'year = {2010}, ' ...
'title = {Breeding behaviour of the Omei tree frog \emph{Rhacophorus omeimontis} ({A}nura: {R}achophoridae) in a subtropical montane region}, ' ...
'journal = {Journal of Natural History}, ' ...
'volume = {44(47–48)}, ' ...
'pages = {2929–2940}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Zhangixalus_omeimontis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
