function [data, auxData, metaData, txtData, weights] = mydata_Crystallogobius_linearis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Crystallogobius_linearis'; 
metaData.species_en = 'Crystal goby'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MANE','MAE','MAm'};
metaData.ecoCode.habitat = {'0jFe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(9.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
comment.Lp = 'based on Aphia_minuta 3.8*3.9/7.9 cm';
data.Li  = 3.9;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
  comment.Li = 'reported as SL, by likely TL, in view of Mesa2001';
data.Lim  = 4.7;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length';  bibkey.Lim  = 'fishbase';
  comment.Lim = 'reported as SL, by likely TL, in view of Mesa2001';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.0513;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00724*Lp^3.05, see F1';
data.Wwi = 0.46;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00724*Li^3.05, see F1';
data.Wwim = 0.81;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'fishbase';
  comment.Wwp = 'based on 0.00724*Lim^3.05, see F1';

data.Ri  = 500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_fm = [... %  time since birth (mnth), total length (cm)
    2 1.50 1.47
    3 2.08 1.88
    4 2.36 2.46
    5 2.91 2.99
    6 2.95 3.53
    7 3.10 3.97];
data.tL_fm(:,1) = data.tL_fm(:,1)*30.5; % convert mnth to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(9.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Mesa2001'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

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
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00724*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FD6P'; % Cat of Life
metaData.links.id_ITIS = '172033'; % ITIS
metaData.links.id_EoL = '46575170'; % Ency of Life
metaData.links.id_Wiki = 'Crystallogobius_linearis'; % Wikipedia
metaData.links.id_ADW = 'Crystallogobius_linearis'; % ADW
metaData.links.id_Taxo = '46558'; % Taxonomicon
metaData.links.id_WoRMS = '126868'; % WoRMS
metaData.links.id_fishbase = 'Crystallogobius-linearis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crystallogobius_linearis}}';
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
bibkey = 'Mesa2001'; type = 'Article'; bib = [ ... 
'author = {M. La Mesa}, ' ... 
'year = {2001}, ' ...
'title = {Age and growth of \emph{Crystallogobius linearis}(von {D}\"{u}ben, 1845) ({T}eleostei: {G}obiidae) from the {A}driatic {S}ea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {65(4)}, ' ...
'pages = {375-381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Crystallogobius-linearis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
