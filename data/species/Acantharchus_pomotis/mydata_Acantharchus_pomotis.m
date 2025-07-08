  function [data, auxData, metaData, txtData, weights] = mydata_Acantharchus_pomotis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Acantharchus_pomotis'; 
metaData.species_en = 'Mud sunfish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f','t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 22]; 

%% set data
% zero-variate data
data.am = 6*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'Pard1993';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 11;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'Pard1993';
  comment.Lp = 'based on tp of 1 yr and tL data'; 
data.Li = 21;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Pard1993';   
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 18.9;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','Pard1993'}; 
  comment.Wwp = 'based on 0.01230*Lp^3.06, see F1';
data.Wwi = 137;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01230*Li^3.06, see F1';

data.Ri = 3812/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Pard1993';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_D = [ ... % year class (yr), total length (cm)
    0  4.53
    1  8.3
    2 11.8
    3 13.7
    4 16.2];
data.tL_D(:,1) = 365 * (0.5 + data.tL_D(:,1)); % convert yr to d
units.tL_D = {'d', 'cm'}; label.tL_D = {'time since birth', 'total length', 'Duke Swamp'};  
temp.tL_D = C2K(21);  units.temp.tL_D = 'K'; label.temp.tL_D = 'temperature';
bibkey.tL_D = 'Pard1993';
comment.tL_D = 'Data from Duke Swamp';
%
data.tL_H = [ ... % year class (yr), std length (cm)
    1   9.1
    2  11.7
    3  13.0
    4  14.7];
data.tL_H(:,1) = 365 * (0.5 + data.tL_H(:,1)); % convert yr to d
units.tL_H = {'d', 'cm'}; label.tL_H = {'time since birth', 'total length', 'Hoggard Mill Creek'};  
temp.tL_H = C2K(21);  units.temp.tL_H = 'K'; label.temp.tL_H = 'temperature';
bibkey.tL_H = 'Pard1993';
comment.tL_H = 'Data from Hoggard Mill Creek';

% time - weight
data.tWw_D = [ ... % year class (yr), wet weight (g)
    1 14
    2 36
    3 55
    4 88];
data.tWw_D(:,1) = 365 * (0.5 + data.tWw_D(:,1)); % convert yr to d
units.tWw_D = {'d', 'g'}; label.tWw_D = {'time since birth', 'wet weight', 'Duke Swamp'};  
temp.tWw_D = C2K(21);  units.temp.tWw_D = 'K'; label.temp.tWw_D = 'temperature';
bibkey.tWw_D = 'Pard1993';
comment.tWw_D = 'Data from Duke Swamp';
%
data.tWw_H = [ ... % year class (yr), wet weight (g)
    1  15
    2  33
    3  45
    4  65];
data.tWw_H(:,1) = 365 * (0.5 + data.tWw_H(:,1)); % convert yr to d
units.tWw_H = {'d', 'g'}; label.tWw_H = {'time since birth', 'wet weight', 'Hoggard Mill Creek'};  
temp.tWw_H = C2K(21);  units.temp.tWw_H = 'K'; label.temp.tWw_H = 'temperature';
bibkey.tWw_H = 'Pard1993';
comment.tWw_H = 'Data from Hoggard Mill Creek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_D = 5 * weights.tL_D;
weights.tL_H = 5 * weights.tL_H;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_D','tL_H'}; subtitle1 = {'Data from Duke Swamp, Hoggard Mill Creek'};
set2 = {'tWw_D','tWw_H'}; subtitle2 = {'Data from Duke Swamp, Hoggard Mill Creek'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.78 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '8T5Y'; % Cat of Life
metaData.links.id_ITIS = '168095'; % ITIS
metaData.links.id_EoL = '216796'; % Ency of Life
metaData.links.id_Wiki = 'Acantharchus_pomotis'; % Wikipedia
metaData.links.id_ADW = 'Acantharchus_pomotis'; % ADW
metaData.links.id_Taxo = '45118'; % Taxonomicon
metaData.links.id_WoRMS = '293694'; % WoRMS
metaData.links.id_fishbase = 'Acantharchus-pomotis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acantharchus_pomotis}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Acantharchus-pomotis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pard1993'; type = 'Article'; bib = [ ...  
'author = {Garland B. Pardue}, ' ...
'year = {1993}, ' ...
'title  = {Life History and Ecology of the Mud Sunfish (\emph{Acantharchus pomotis})}, ' ...
'journal = {Copeia}, ' ...
'volume = {1993(2)}, ' ...
'pages = {533-540}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

