  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_kiyi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_kiyi'; 
metaData.species_en = 'Kiyi'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];


%% set data
% zero-variate data
data.ab = 130;   units.ab = 'd';  label.ab = 'age at birth';            bibkey.ab = 'ADW';   
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '120-140 d; temperature is guessed';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'ADW'; 
data.Li = 35;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm: pi/6*0.225^3';
data.Wwp = 24.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.22, see F1';
data.Wwi = 565;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.22, see F1';
    
data.Ri = 53000/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'ADW';
  temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (inch)
0	 0.054
1	 4.988
2	 6.752
3	 8.733
4	 9.494
5	10.284
6   10.558
7	10.751
8	10.808];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
data.tL_f(:,2) = data.tL_f(:,2) * 2.54; % convert inch to cm
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DeasHile1947';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (inch)
0	0.051
1	4.879
2	6.806
3	8.299
4	9.197
5	9.579
6	10.097
7	10.534];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
data.tL_m(:,2) = data.tL_m(:,2) * 2.54; % convert inch to cm
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DeasHile1947';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (once)
0	0.040
1	0.465
2	1.475
3	2.788
4	3.838
5	4.687
6	5.222
7	5.616
8	5.747];
data.tWw_f(:,1) = 365 * data.tWw_f(:,1);
data.tWw_f(:,2) = data.tWw_f(:,2) * 28.34952; % convert once to g
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(9);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DeasHile1947';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), , wet weight (once)
0	0.020
1	0.465
2	1.414
3	2.525
4	3.444
5	3.980
6	4.606
7	5.293];
data.tWw_m(:,1) = 365 * data.tWw_m(:,1);
data.tWw_m(:,2) = data.tWw_m(:,2) * 28.34952; % convert once to g
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(9);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'DeasHile1947';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.00603*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'YD9X'; % Cat of Life
metaData.links.id_ITIS = '161945'; % ITIS
metaData.links.id_EoL = '217016'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_kiyi'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_kiyi'; % ADW
metaData.links.id_Taxo = '171714'; % Taxonomicon
metaData.links.id_WoRMS = '1016849'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-kiyi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_kiyi}}';  
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
bibkey = 'DeasHile1947'; type = 'Article'; bib = [ ...  
'doi = {10.1577/1548-8659(1944)74[88:AAGOTK]2.0.CO;2}, ' ...
'author = {Hilary J. Deason and Ralph Hile}, ' ...
'year = {1947}, ' ...
'title = {Age and Growth of the Kiyi, \emph{Leucichthys kiyi} {K}oelz, in {L}ake {M}ichigan}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'pages = {88-142}, ' ...
'volume = {74(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-kiyi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

