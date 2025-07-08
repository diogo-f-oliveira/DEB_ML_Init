  function [data, auxData, metaData, txtData, weights] = mydata_Sander_volgensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Sander_volgensis'; 
metaData.species_en = 'Volga pikeperch'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 28];                           
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
data.ab = 15;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 18 d';
data.am = 12*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase'; 
  comment.Lp = '20 to 30 cm';
data.Li = 45;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Aart2007';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Sander lucioperca: pi/6*0.09^3';
data.Wwp = 176;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00871*Lp^3.08, see F1';
data.Wwi = 1.08e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.08, see F1';

data.GSI = 0.0774;   units.GSI = '-';  label.GSI = 'gonado somatic index';           bibkey.GSI = 'MishRasp2016';
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1 5.5
2 10.4
3 16.3
4 21.4
5 26.8];
data.tL_f(:,1) = 365 * (0.25 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kuzn2010';
comment.tL_f = 'Data for females in upper part of the Volga stretch of the Kuibyshev Reservoir';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1 4.8
2 9.9
3 15.8
4 21.4
5 25.4];
data.tL_m(:,1) = 365 * (0.25 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kuzn2010';
comment.tL_m = 'Data for males in upper part of the Volga stretch of the Kuibyshev Reservoir';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XHMC'; % Cat of Life
metaData.links.id_ITIS = '650179'; % ITIS
metaData.links.id_EoL = '46580137'; % Ency of Life
metaData.links.id_Wiki = 'Sander_volgensis'; % Wikipedia
metaData.links.id_ADW = 'Sander_volgensis'; % ADW
metaData.links.id_Taxo = '186512'; % Taxonomicon
metaData.links.id_WoRMS = '275312'; % WoRMS
metaData.links.id_fishbase = 'Sander-volgensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sander_volgensis}}';  
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
bibkey = 'Kuzn2010'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210090109}, ' ...
'author = {V. A. Kuznetsov}, ' ...
'year = {2010}, ' ...
'title = {Growth, Size-Age Structure of Catches and Reproduction of the {V}olga Zander \emph{Sander volgensis} ({P}ercidae) in the Upper Part of the {V}olga Stretch of the {K}uibyshev {R}eservoir}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {50}, '...
'pages = {772-777}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MishRasp2016'; type = 'Article'; bib = [ ... 
'author = {Mishenko, A. V. and Raspopov, V. M. and Ali Attaala, M. and Begmanova, A.B. and Bogatov, I. A. and Sergeeva, J.V. and Bakhareva, A. A. and Grozesku, J. N.}, ' ...
'year = {2016}, ' ...
'title = {Evaluation of the physiological state of the {V}olga pikeperch (\emph{Sander volgensis}) fingerlings raised in a closed water system}, ' ... 
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {4}, '...
'pages = {408-413}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aart2007'; type = 'Techreport'; bib = [ ...  
'author = {Aarts, T. W. P. M.}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument snoekbaars, \emph{Sander lucioperca} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {16}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-pos_4554.pdf}+}'];
%
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sander-volgensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

