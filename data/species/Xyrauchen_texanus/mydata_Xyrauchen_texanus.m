  function [data, auxData, metaData, txtData, weights] = mydata_Xyrauchen_texanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Xyrauchen_texanus'; 
metaData.species_en = 'Razorback sucker'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp (ADW) 
metaData.data_0     = {'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 24]; 


%% set data
% zero-variate data
data.tp = 4*365;   units.tp = 'd';  label.tp = 'life span';                       bibkey.tp = 'Wiki';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guessed temp, both males and females.';
data.am = 50*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ADW';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.8;  units.Lh = 'cm'; label.Lh = 'total length at hatch';  bibkey.Lh = 'ADW'; 
data.Lp = 54;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'Based on same relative length, compared to Catostomus_catostomus';
data.Li = 91;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki';
data.Lim = 90;    units.Lim = 'cm'; label.Lim = 'ultimate total length for  males';  bibkey.Lim = 'ADW';
  comment.Lim = 'Based on males being 10% smaller in length than females';

data.Wwb = 5.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Bail1969';
  comment.Wwb = 'Based on egg diameter of 2.2 mm of Catostomus_catostomus: pi/6*0.22^3';
data.Wwi = 6e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'Wiki';

data.Ri = 103000/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL = 35.6 cm';    bibkey.Ri = 'fws';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed.';

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'A single female is attended by two to twelve males, and the female will spawn repeatedly with several males';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'All life stages of razorback sucker consume insects, zooplankton, phytoplankton, algae, and detritus; however, diet varies by age and habitat';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CP8K'; % Cat of Life
metaData.links.id_ITIS = '163968'; % ITIS
metaData.links.id_EoL = '203898'; % Ency of Life
metaData.links.id_Wiki = 'Xyrauchen_texanus'; % Wikipedia
metaData.links.id_ADW = 'Xyrauchen_texanus'; % ADW
metaData.links.id_Taxo = '42303'; % Taxonomicon
metaData.links.id_WoRMS = '1021240'; % WoRMS
metaData.links.id_fishbase = 'Xyrauchen-texanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Razorback_sucker}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fws'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fwspubs.org/doi/suppl/10.3996/092012-JFWM-084/suppl_file/10.3996_092012-jfwm-084.s7.pdf}}';  
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
bibkey = 'Bail1969'; type = 'Article'; bib = [ ...  
'author = {Merryll M. Bailey}, ' ...
'year = {1969}, ' ...
'title = {Age, Growth, and Maturity of the Longnose Sucker \emph{Catostomus catostomus} of Western {L}ake {S}uperior}, ' ... 
'journal = {J. Fish, Res. Brd Canada}, ' ...
'volume = {26}, '...
'pages = {1289--1299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Xyrauchen-texanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Xyrauchen_texanus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];