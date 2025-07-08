function [data, auxData, metaData, txtData, weights] = mydata_Schilbe_uranoscopus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = 'Schilbe_uranoscopus'; 
metaData.species_en = 'African butter catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 09];

%% set data
% zero-variate data
data.ab = 6.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 36;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.5e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Schilbe mystus: pi/6*0.066^3';
data.Wwp = 58;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00589*Lp^3.02, see F1';
data.Wwi = 295;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00589*Li^3.02, see F1';
  
data.Ri = 16e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Schilbe_intermedius: 62e3*295/1.1e3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
320.193	4.763
349.675	7.282
365+47.593	12.849
365+75.550	15.011
365+107.743	16.610
365+136.000	18.588
365+168.185	19.732
365+198.856	21.065
365+229.244	23.398
365+260.803	23.636
365+319.391	25.130
365+350.390	27.643
730+46.984	27.761
730+75.234	29.375
730+107.694	29.155
730+168.102	30.642];
data.tL(:,1) = data.tL(:,1) - 250; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
  temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V88J'; % Cat of Life
metaData.links.id_ITIS = '681889'; % ITIS
metaData.links.id_EoL = '339215'; % Ency of Life
metaData.links.id_Wiki = 'Schilbe'; % Wikipedia
metaData.links.id_ADW = 'Schilbe_uranoscopus'; % ADW
metaData.links.id_Taxo = '186747'; % Taxonomicon
metaData.links.id_WoRMS = '1022398'; % WoRMS
metaData.links.id_fishbase = 'Schilbe-uranoscopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Schilbe}}';  
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schilbe-uranoscopus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

