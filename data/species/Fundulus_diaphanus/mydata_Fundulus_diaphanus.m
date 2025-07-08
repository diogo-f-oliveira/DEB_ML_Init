  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_diaphanus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_diaphanus'; 
metaData.species_en = 'Banded studfish'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 01]; 

%% set data
% zero-variate data
data.am = 3.2*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'EdbePowe2010';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp =  3.7;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'PhilEwer2007'; 
data.Li = 9.5;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'PhilEwer2007';
data.Lim = 5.9;     units.Lim = 'cm';     label.Lim = 'ultimate standard length for males';  bibkey.Lim = 'PhilEwer2007';

data.Wwb = 1.09e-2;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 2.75 mm of F.stellifer: pi/6*0.275^3';
data.Wwi = 8.2;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'PhilEwer2007';   
data.Wwim = 1.99;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'PhilEwer2007';   

data.Ri = 1062/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'PhilEwer2007';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time - length
data.tL = [ ... % time (d), std length (cm)
 365 3.7
 730 5.2
1095 5.9];
data.tL(:,1) = data.tL(:,1) - 70; % set origin on birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PhilEwer2007';

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
               
%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.14'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo SL =  0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6K3FB'; % Cat of Life
metaData.links.id_ITIS = '165646'; % ITIS
metaData.links.id_EoL = '46566773'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_diaphanus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_diaphanus'; % ADW
metaData.links.id_Taxo = '192753'; % Taxonomicon
metaData.links.id_WoRMS = '159296'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-diaphanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_diaphanus}}';
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
bibkey = 'PhilEwer2007'; type = 'Article'; bib = [ ...
'doi = {10.1656/1092-6194(2007)14[269:FAAGAD]2.0.CO;2}, ' ...
'author = {Phillips, Edward C. and Ewert, Yvonne and Speares, Patricia A.}, ' ...
'year = {2007}, ' ...
'title = {Fecundity, Age and Growth, and Diet of \emph{Fundulus diaphanus} (Banded Killifish) in {P}resque {I}sle {B}ay, {L}ake {E}rie}, ' ... 
'journal = {Northeastern Naturalist}, ' , ...
'volume = {14(2)}, ' ...
'pages = {269-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-diaphanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


