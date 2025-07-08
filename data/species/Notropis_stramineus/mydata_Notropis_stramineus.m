function [data, auxData, metaData, txtData, weights] = mydata_Notropis_stramineus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_stramineus'; 
metaData.species_en = 'Sand shiner'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 22]; 

%% set data
% zero-variate data

data.tp = 0.7*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on spawning at 365 d posthatch';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'SummMinc1969';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.8;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'SummMinc1969'; 
  comment.Lp = 'based on TL 3.2 cm at first spawning';
data.Li = 8.2;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SummMinc1969';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 0.53;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','SummMinc1969'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 5.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

data.Ri  = 2600/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    335 3.2
    700 5.2];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SummMinc1969'; 

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

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '47ZKL'; % Cat of Life
metaData.links.id_ITIS = '163419'; % ITIS
metaData.links.id_EoL = '211740'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_stramineus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_stramineus'; % ADW
metaData.links.id_Taxo = '181552'; % Taxonomicon
metaData.links.id_WoRMS = '1020955'; % WoRMS
metaData.links.id_fishbase = 'Notropis-stramineus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_stramineus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-stramineus.html}}';  
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
bibkey = 'SummMinc1969'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1969)98[444:AOTLHO]2.0.CO;2}, ' ... 
'author = {Robert C. Summerfelt and Charles O. Minckley}, ' ... 
'year = {1969}, ' ...
'title = {Aspects of the Life History of the Sand Shiner, \emph{Notropis stramineus} ({C}ope), in the {S}moky {H}ill {R}iver, {K}ansas}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {98(3)}, ' ...
'pages = {444-453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

