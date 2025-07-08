  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_alosa

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_alosa'; 
metaData.species_en = 'Alis shad'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'THp'};
metaData.ecoCode.habitat = {'jiMpe', 'piFr', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 13];                           
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
data.tp = 5.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Laak2009'; 
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';bibkey.tpm = 'Laak2009'; 
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Laak2009';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Laak2009';

data.Wwb = 0.0141; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Laak2009';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 4492;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Laak2009';
  comment.Wwi = 'based on (L(6)/70)^3 * W(6) from tL_f data';
  
data.Ri = 2e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = {'Laak2009'};   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
% females
tL_f = [ ... % time since birth (yr), min/max total length (cm)
1 13.36 22.30
2 21.60 34.15
3 43.47 43.60
4 48.70 50.40
5 54.70 57.60
6 58.21 58.21];
data.tL_f = [tL_f(:,1) * 365, sum(tL_f(:,[2 3]),2)/2]; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = {'Laak2009'};
comment.tL_f = 'Data for females';
% males
tL_m = [ ... % time since birth (d), min/max total length (cm)
1  8.92 10.93
2 18.38 23.78 
3 30.72 51.00
4 41.23 57.50
5 45.40 62.00
6 49.00 61.00
7 55.64 65.55];
data.tL_m = [tL_m(:,1) * 365, sum(tL_m(:,[2 3]),2)/2]; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = {'Laak2009'};
comment.tL_m = 'Data for males';

% time-length
% females
tW_f = [ ... % time since birth (yr), min/max wet weight (g)
2  152  152
4  852 2171
5 1701 2872
6 2005 3162
7 2565 3368
8 3050 3580];
data.tW_f = [tW_f(:,1) * 365, sum(tW_f(:,[2 3]),2)/2]; % convert yr to d
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
  temp.tW_f = C2K(10);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = {'Laak2009'};
comment.tW_f = 'Data for females';
% males
tW_m = [ ... % time since birth (yr), min/max wet weight (g)
2   84   84
3  653 1407
4  979 1619
5 1310 1950
6 1657 2225
7 1703 2114];
data.tW_m = [tW_m(:,1) * 365, sum(tW_m(:,[2 3]),2)/2]; % convert yr to d
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
  temp.tW_m = C2K(10);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = {'Laak2009'};
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp and del_M only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'C5LK'; % Cat of Life
metaData.links.id_ITIS = '161708'; % ITIS
metaData.links.id_EoL = '46562369'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_alosa'; % Wikipedia
metaData.links.id_ADW = 'Alosa_alosa'; % ADW
metaData.links.id_Taxo = '42627'; % Taxonomicon
metaData.links.id_WoRMS = '126413'; % WoRMS
metaData.links.id_fishbase = 'Alosa-alosa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_alosa}}';  
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
bibkey = 'Laak2009'; type = 'Techreport'; bib = [ ...  
'author = {G. A. J. de Laak}, ' ...
'year = {2009}, ' ...
'title = {Kennisdocument elft}, ' ...
'howpublished = {\verb+http://www.sportvisserijnederland.nl/files/kd-elft_5164.pdf+}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  