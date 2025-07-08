  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_seminolis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_seminolis'; 
metaData.species_en = 'Seminole killifish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 02]; 

%% set data
% zero-variate data
data.am = 2*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'DuraShir1979';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp =  6;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'DuraShir1979'; 
data.Li = 16;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'DuraShir1979';

data.Wwb = 4.6e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 2.06 mm of F. kansae: pi/6*0.206^3';
data.Wwi = 30.8;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'DuraShir1979','fishbase'}; 
  comment.Wwi = 'based on 0.00603*Li^3.08';
   
data.GSI = 0.05;  units.GSI = 'mol/mol'; label.GSI = 'gonadal somatic index';   bibkey.GSI = 'DuraShir1979';
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 
  
% uni-variate data
% time - length
data.tL = [ ... % time (d), total length (cm)
 45  2.5
150  9
245 12.5
500 16];
data.tL(:,1) = data.tL(:,1) + 20; % set origin on birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuraShir1979';

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
D1 = 'mean temperatures are guessed';
D2 = 'tL data reconstructed from length-frequency counts';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JRGS'; % Cat of Life
metaData.links.id_ITIS = '165667'; % ITIS
metaData.links.id_EoL = '207293'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_seminolis'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_seminolis'; % ADW
metaData.links.id_Taxo = '174587'; % Taxonomicon
metaData.links.id_WoRMS = '422557'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-seminolis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_seminolis}}';
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
bibkey = 'DuraShir1979'; type = 'Article'; bib = [ ...
'author = {Douglas F. Durant and Jerome V. Shireman and Robert D. Gasaway}, ' ...
'year = {1979}, ' ...
'title = {Reproduction, Growth and Food Habits of Seminole Killifish, \emph{Fundulus seminolis}, from Two Central {F}lorida Lakes}, ' ... 
'journal = {The American Midland Naturalist}, ' , ...
'volume = {102(1)}, ' ...
'pages = {127-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-seminolis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


