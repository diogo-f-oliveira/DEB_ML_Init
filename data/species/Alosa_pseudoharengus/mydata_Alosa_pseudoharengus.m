  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_pseudoharengus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_pseudoharengus'; 
metaData.species_en = 'Alewive'; 

metaData.ecoCode.climate = {'Cfa','Dfa', 'Dwa', 'MC'};
metaData.ecoCode.ecozone = {'THn','MAW'};
metaData.ecoCode.habitat = {'piMpe', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 06 30];                           
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
data.ab = 3.7; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'WallYeag1990';   
  temp.ab = C2K(121);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5.8*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Mess1977'; 
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5.5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Mess1977'; 
  temp.tpm = C2K(17);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26.5; units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'Mess1977';
data.Lpm = 25;  units.Lpm = 'cm';   label.Lpm = 'fork length at puberty for males';bibkey.Lpm = 'Mess1977';
data.Li = 31;   units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';
data.Lim = 29;   units.Lim = 'cm';   label.Lim = 'ultimate fork length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 6.9e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwi = 1700;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 3.6e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'WallYeag1990';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.104	10.243
1.262	11.626
1.603	14.155
1.967	16.398
2.501	19.642
3.144	22.266
3.786	24.366
4.840	26.751
5.712	27.944
7.020	29.137];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'Mess1977';
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females; data read from curve, not points';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.971	9.193
1.129	10.481
1.639	14.107
2.088	16.732
2.585	19.070
3.192	21.503
3.992	23.889
4.840	25.797
5.736	26.942
7.008	28.040];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'Mess1977';
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males; data read from curve, not points';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
23.094	174.565
24.348	209.305
25.965	262.201
27.661	320.047
29.679	401.805
31.978	496.771];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'total length', 'wet weight', 'female'};  bibkey.LWw_f = 'Mess1977';
comment.LWw_f = 'Data for females; data read from curve, not points';
%
data.LWw_m = [ ... % log10 total length (mm), wet weight (g)
22.124	147.271
23.946	187.850
24.998	215.155
26.332	254.021
28.070	309.404
29.604	369.696
31.096	430.806];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'total length', 'wet weight', 'male'};  bibkey.LWw_m = 'Mess1977';
comment.LWw_m = 'Data for males; data read from curve, not points';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Wwi = 0 * weights.Wwi;
weights.tp = 0 * weights.tp;
weights.tpm = 0 * weights.tpm;

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'C5MR'; % Cat of Life
metaData.links.id_ITIS = '161706'; % ITIS
metaData.links.id_EoL = '46562373'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_pseudoharengus'; % Wikipedia
metaData.links.id_ADW = 'Alosa_pseudoharengus'; % ADW
metaData.links.id_Taxo = '160465'; % Taxonomicon
metaData.links.id_WoRMS = '158669'; % WoRMS
metaData.links.id_fishbase = 'Alosa-pseudoharengus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_pseudoharengus}}';  
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
'howpublished = {\url{www.fishbase.org/summary/Alosa-pseudoharengus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mess1977'; type = 'Article'; bib = [ ...  
'author = {Shoukry N. Messieh}, ' ...
'year = {1977}, ' ...
'title  = {Population structure and biology of alewives (\emph{Alosa pseudoharengus}) and blueback herring (\emph{A. aestivalis}) in the {S}aint {J}ohn {R}iver, {N}ew {B}runswick}, ' ...
'journal = {Env. Biol. Fish.}, ' ...
'volume = {2}, ' ...
'pages = {195-210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  