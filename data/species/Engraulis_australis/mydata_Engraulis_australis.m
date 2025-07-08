  function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_australis

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_australis'; 
metaData.species_en = 'Australian anchovy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 11];

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(17.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 15;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.2 mm and width 0.7 mm of Engraulis_anchoita: pi/6*0.12*0.07^2';
data.Wwi = 21.3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.12, see F1';
  
data.Ri = 1.1e5/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Engraulis mordax; 6e5*21.3/110';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
0.029	5.493
1.047	5.754
2.065	5.937
3.084	6.454
4.044	6.420
5.004	6.523
6.982	6.651
8.058	6.676];
data.tL(:,1) = (data.tL(:,1)+6)* 30.5; % convert nmth to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(17.1); units.temp.tL = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL = 'Blac1967'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_S','tL_W'}; subtitle1 = {'Data from South and West coast of S-Africa'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39TKJ'; % Cat of Life
metaData.links.id_ITIS = '161834'; % ITIS
metaData.links.id_EoL = '46562564'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_australis'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_australis'; % ADW
metaData.links.id_Taxo = '173702'; % Taxonomicon
metaData.links.id_WoRMS = '272285'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Engraulis_australis}}';  
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
bibkey = 'Blac1967'; type = 'techreport'; bib = [ ...  
'author = {Blackburn, M.}, ' ...
'year = {1967}, ' ...
'title = {Synopsis of biological information on the Australian anchovy \emph{Engraulis australis} ({W}hite)}, ' ... 
'institution = {Institute of Marine Resources; Scripps Institution of Oceanography University of California, La Jolla, California}, ' ...
'volume = {11}, ' ...
'pages = {34-43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Engraulis-australis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
