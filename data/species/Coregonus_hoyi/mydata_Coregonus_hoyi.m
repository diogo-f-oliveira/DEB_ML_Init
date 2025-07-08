  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_hoyi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_hoyi'; 
metaData.species_en = 'Bloater'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

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
data.am = 11*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.6;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 37;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Computed from egg diameter of 1.5 mm for Coregonus albula: 4/3*pi*0.075^3';
data.Wwp = 61.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00617*Lp^3.21, see F1';
data.Wwi = 667;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.21, see F1';
    
data.Ri = 34891/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.883	14.029
1.915	16.505
2.919	18.350
3.950	21.408
4.941	23.155
5.945	25.146
6.989	26.650
7.993	27.087
9.024	29.369];
data.tL_f(:,1) = 365 * (1.7 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Scha2004';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.897	14.272
1.914	16.117
2.919	18.301
3.964	21.019
4.968	22.670
5.958	24.175
6.988	24.854
7.992	25.049
8.995	26.165];
data.tL_m(:,1) = 365 * (1.7 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Scha2004';
comment.tL_m = 'Data for males';

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.00617*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'YD9R'; % Cat of Life
metaData.links.id_ITIS = '161943'; % ITIS
metaData.links.id_EoL = '994757'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_hoyi'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_hoyi'; % ADW
metaData.links.id_Taxo = '171711'; % Taxonomicon
metaData.links.id_WoRMS = '1049459'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-hoyi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_hoyi}}';  
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
bibkey = 'Scha2004'; type = 'Article'; bib = [ ...  
'author = {Jeffrey S. Schaeffer}, ' ...
'year = {2004}, ' ...
'title = {Population dynmaics of bloaters \emph{Coregonus hoyi} in {L}ake {H}uron, 1980-1998}, ' ... 
'journal = {Ann. Zool. Fennic.}, ' ...
'pages = {271-279}, ' ...
'volume = {41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-hoyi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

