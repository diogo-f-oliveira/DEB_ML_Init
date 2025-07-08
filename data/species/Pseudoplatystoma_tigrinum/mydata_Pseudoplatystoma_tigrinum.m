  function [data, auxData, metaData, txtData, weights] = mydata_Pseudoplatystoma_tigrinum
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Pseudoplatystoma_tigrinum'; 
metaData.species_en = 'Tiger sorubim'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 99;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 130;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';
data.Wwp = 8.8e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 20.6e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri = 3.4e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  36.0 35.4
    2  48.7 47.0
    3  61.4 60.2
    4  70.5 66.8
    5  77.1 75.9
    6  89.4 84.4
    7  94.6 92.2
    8  99.2 95.2
    9 107.0 98.2
   10 107.4 101.3
   11 112.3 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.6) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(26);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LoubPanf2000'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P84Y'; % Cat of Life
metaData.links.id_ITIS = '681794'; % ITIS
metaData.links.id_EoL = '206923'; % Ency of Life
metaData.links.id_Wiki = 'Pseudoplatystoma_tigrinum'; % Wikipedia
metaData.links.id_ADW = 'Pseudoplatystoma_tigrinum'; % ADW
metaData.links.id_Taxo = '185278'; % Taxonomicon
metaData.links.id_WoRMS = '1022312'; % WoRMS
metaData.links.id_fishbase = 'Pseudoplatystoma-tigrinum'; % fishbase

%% ReferenPseudoplatystoma_fasciatumces
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pseudoplatystoma_tigrinum}}';  
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
bibkey = 'LoubPanf2000'; type = 'Article'; bib = [ ...
'author = {Loubens, G. and J. Panfili}, ' ...
'year = {2000}, ' ...
'title = {Biologie de \emph{Pseudoplatystoma fasciatum} et \emph{P. tigrinum} ({T}eleostei: {P}imelodidae) dans le bassin du {M}amor\''{e} ({A}mazonie {B}olivienne)}, ' ... 
'journal = {Ichthyol. Explor. Freshwat.}, ' ...
'volume = {11(1)}, '...
'pages = {13-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudoplatystoma-tigrinum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

