  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_sagitta
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_sagitta'; 
metaData.species_en = 'Arrow darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.tp = 1.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Lowe1979';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Lowe1979';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.8;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Lowe1979'; 
data.Li = 10.44;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 12 cm, and from photo: SL=0.87*TL';

data.Wwb = 3.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Lowe1979';
  comment.Wwb = 'based on egg diameter of 1.9 mm: pi/6*0.19^3';
data.Wwi = 12.55;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*12^3.14, see F1, F2';

data.Ri = 800/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0 2.44
0 3.73
1 4.32
2 5.38
3 6.38];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lowe1979';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0 4.41
1 4.70
2 5.79
3 7.38];
data.tL_m(:,1) = 365 * (0.2 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lowe1979';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0 0.16
0 0.5
1 0.81
2 1.64
3 3.06];
data.tWw_f(:,1) = 365 * (0.2 + data.tWw_f(:,1));  % convert yr to d
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Lowe1979';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0 0.94
1 1.11
2 1.90
3 3.06];
data.tWw_m(:,1) = 365 * (0.2 + data.tWw_m(:,1));  % convert yr to d
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Lowe1979';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.Li =  5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6H'; % Cat of Life
metaData.links.id_ITIS = '168430'; % ITIS
metaData.links.id_EoL = '217188'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_sagitta'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_sagitta'; % ADW
metaData.links.id_Taxo = '174146'; % Taxonomicon
metaData.links.id_WoRMS = '1466705'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-sagitta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_sagitta}}';  
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
bibkey = 'Lowe1979'; type = 'PhDthesis'; bib = [ ... 
'author = {John Eldon Lowe}, ' ...
'year = {1979}, ' ...
'title = {The Life History, Behavior, and Ecology of \emph{Etheostoma sagitta} ({J}ordan and {S}wain)}, ' ... 
'school = {Univ of Tennessee, Knoxville}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-sagitta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
