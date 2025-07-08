function [data, auxData, metaData, txtData, weights] = mydata_Lepidomeda_copei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Lepidomeda_copei'; 
metaData.species_en = 'Northern leatherside chub'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 02]; 

%% set data
% zero-variate data

data.am = 8*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'JohnBelk1995';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5.3;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'JohnBelk1995';
  comment.Lp = 'based on first spawning at SL 6.7';
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.47;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','JohnBelk1995'};
  comment.Wwp = 'based on 0.00891*Lp^3.06, F1';
data.Wwi = 35.4;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = {'fishbase','JohnBelk1995'};
  comment.Wwi = 'based on 0.00891*Li^3.06, F1';

data.Ri = 2573/365; units.Ri = '#/d';  label.Ri = 'reprod rate at SL 92 mm, TL 108 mm';  bibkey.Ri = 'JohnBelk1995';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time (yr), std length (cm)
    1 3.7
    2 5.8
    3 6.7
    4 7.4
    5 8.1
    6 8.7
    7 9.0
    8 9.3];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JohnBelk1995'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3TC4R'; % Cat of Life
metaData.links.id_ITIS = '913987'; % ITIS
metaData.links.id_EoL = '4624983'; % Ency of Life
metaData.links.id_Wiki = 'Lepidomeda_copei'; % Wikipedia
metaData.links.id_ADW = 'Lepidomeda_copei'; % ADW
metaData.links.id_Taxo = '2705659'; % Taxonomicon
metaData.links.id_WoRMS = '1019999'; % WoRMS
metaData.links.id_fishbase = 'Lepidomeda-copei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepidomeda_copei}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Lepidomeda-copei.html}}';  
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
bibkey = 'JohnBelk1995'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Jerald B. Johnson and Mark C. Belk and Dennis K. Shiozawa}, ' ...
'year = {1995}, ' ...
'title  = {Age, growth, and reproduction of leatherside chub (\emph{Gila copei})}, ' ...
'journal = {Great Basin Naturalist}, ' ...
'pages = {l83-187}, ' ...
'volume = {55(2)}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
