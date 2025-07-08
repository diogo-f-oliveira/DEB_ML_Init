  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_americanus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_americanus'; 
metaData.species_en = 'American anglerfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE','MPSE','MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-N'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 11];

%% set data
% zero-variate data
data.am = 30*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 60;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'ArmsMusi1992'; 
data.Lpm = 37.5;   units.Lpm = 'cm';  label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'ArmsMusi1992'; 
data.Li = 120;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  
data.Wwb = 1.6e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ArmsMusi1992';
  comment.Wwb = 'based on egg diameter of 0.67 mm of Lophius piscatorius (from fishbase): pi/6*0.067^3';
data.Wwi = 21.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^2.98, see F1';
    
% uni-variate data
% time-length
data.tL_fm = [ ... simce since hatch (d), total length (cm)
    1	17.031 17.52
    2	31.370 32.79
    3	41.520 43.55
    4	52.867 52.80
    5	66.009 60.30
    6	71.672 66.79
    7	80.024 69.03
    8	87.481 81.79
    9	94.040 91.29
   10	99.998 NaN
   11  103.865 NaN];
data.tL_fm(:,1) = (0+data.tL_fm(:,1))*365;  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm = C2K(5); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ArmsMusi1992'; treat.tL_fm = {1 {'females','males'}};
 
% length-fecundity
data.LN = [ ... % totla length (cm), fecundity (1e6 #)
60.929	0.550
70.500	0.649
73.071	0.863
74.143	0.314
75.714	1.452
78.214	0.768
79.643	1.382
83.857	1.248
85.429	1.914
87.000	1.714
87.071	1.235
88.786	1.494
93.071	1.968
97.714	1.387
98.143	2.803
98.929	1.930
104.857	2.255];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity in 1e6'}; 
temp.LN = C2K(5); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ArmsMusi1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only ';
metaData.discussion = struct('D1',D1);  
                                 
%% Facts
F1 = 'length-weight Ww in g = 0.01380*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W2MQ'; % Cat of Life
metaData.links.id_ITIS = '164499'; % ITIS
metaData.links.id_EoL = '46566107'; % Ency of Life
metaData.links.id_Wiki = 'Lophius_americanus'; % Wikipedia
metaData.links.id_ADW = 'Lophius_americanus'; % ADW
metaData.links.id_Taxo = '44234'; % Taxonomicon
metaData.links.id_WoRMS = '159184'; % WoRMS
metaData.links.id_fishbase = 'Lophius-americanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius_americanus}}';  
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
bibkey = 'ArmsMusi1992'; type = 'Article'; bib = [ ...  
'author = {Michael P. Armstrong and John A. Musick and James A. Colvocoresses}, ' ...
'year = {1992}, ' ...
'title = {Age, growth, and reproduction of the goosefish \emph{Lophius americanus} ({P}isces: {L}ophiiformes)}, ' ... 
'journal = {Fishery Bulletin, U.S.}, ' ...
'volume = {90}, '...
'pages = {217-230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lophius-americanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
