function [data, auxData, metaData, txtData, weights] = mydata_Odontesthes_nigricans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Odontesthes_nigricans'; 
metaData.species_en = 'Silverside'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcp', '0iMm', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 13];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 21.6;     units.Li  = 'cm';  label.Li  = 'ultimate std length';    bibkey.Li  = 'fishbase';
  comment.Li = 'fishbases gives TL 18 cm';

data.Wwb = 5.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.8-2.5 mm of Odontesthes_regia: pi/6*0.22^3';
data.Wwp  = 10.7;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.01, see F1';
data.Wwi  = 62.7;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.01, see F1';

data.Ri = 4e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Odontesthes_regia: 7318*(21.6/26)^3';
  
% uni-variate data
% time-length
data.tL = [ ... time since birth (yr), total length (cm)
0.899	 6.070
0.909	 5.908
1.911	10.570
1.921	 9.598
1.922	 9.274
1.923	 8.505
1.931	 9.801
1.952	10.206
2.902	12.600
2.912	14.057
2.933	13.369
2.943	12.357
2.953	13.612
3.904	16.735
3.905	16.290
3.924	15.683
4.915	19.899
4.916	17.794
4.926	18.604
4.936	19.575
4.956	19.009
5.907	20.593
5.927	21.119];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'}; 
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LattLoza2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
%weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.89*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '48NRW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46566587'; % Ency of Life
metaData.links.id_Wiki = 'Odontesthes'; % Wikipedia
metaData.links.id_ADW = 'Odontesthes_nigricans'; % ADW
metaData.links.id_Taxo = '181646'; % Taxonomicon
metaData.links.id_WoRMS = '281828'; % WoRMS
metaData.links.id_fishbase = 'Odontesthes-nigricans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontesthes}}'];
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
bibkey = 'LattLoza2015'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ecss.2015.03.019}, ' ...
'author = {Lattuca, M. E. and Lozano, I. E. and Brown, D. R. and Renzi, M. and Luizon, C. A.}, ' ... 
'year = {2015}, ' ...
'title = {Natural growth, otolith shape and diet analyses of \emph{Odontesthes nigricans} {R}ichardson ({A}therinopsidae) from southern {P}atagonia}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {166}, ' ...
'pages = {105–114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Odontesthes-nigricans.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
