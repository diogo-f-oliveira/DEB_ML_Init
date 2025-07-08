  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_platyrhynchus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_platyrhynchus'; 
metaData.species_en = 'Mountain sucker'; 

metaData.ecoCode.climate = {'BWk','BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 29]; 

%% set data
% zero-variate data
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Haus1968';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'fishbase'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 3.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Haus1968';
  comment.Wwb = 'based on egg diameter of 1.74-2.2 mm for C. : pi/6*0.19^3';
data.Wwp = 10.4; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00631*Lp^3.09, see F1';
data.Wwi =131.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.09, see F1';

data.R13 = 990/365;   units.R13 = '#/d';  label.R13 = 'reprod rate at TL 13.1 cm';  bibkey.R13 = 'Haus1968';
  temp.R13 = C2K(14); units.temp.R13 = 'K'; label.temp.R13 = 'temperature';
data.R18 = 3710/365;   units.R18 = '#/d';  label.R18 = 'reprod rate at TL 18.4 cm'; bibkey.R18 = 'Haus1968';
  temp.R18 = C2K(14); units.temp.R18 = 'K'; label.temp.R18 = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
1  6.05
2  9.87
3 11.53
4 13.32
5 14.93
6 16.46
7 18.75
8 20.29
9 22.08];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Haus1968';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631 * (TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RW55'; % Cat of Life
metaData.links.id_ITIS = '163909'; % ITIS
metaData.links.id_EoL = '994730'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_platyrhynchus'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_platyrhynchus'; % ADW
metaData.links.id_Taxo = '166651'; % Taxonomicon
metaData.links.id_WoRMS = '592848'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-platyrhynchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_platyrhynchus}}';  
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
bibkey = 'Haus1968'; type = 'phdthesis'; bib = [ ... 
'author = {William Joseph Hauser}, ' ...
'year = {1968}, ' ...
'title = {Life history of the mountain sucker (Catostomus platyrhynchus) in Montana}, ' ... 
'school = {Montana State Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-platyrhynchus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Catostomus_commersonii/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

