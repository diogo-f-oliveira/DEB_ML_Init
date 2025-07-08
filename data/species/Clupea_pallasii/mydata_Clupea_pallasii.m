  function [data, auxData, metaData, txtData, weights] = mydata_Clupea_bentincki

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Clupea_pallasii'; 
metaData.species_en = 'Pacific herring'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MN'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.8); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};                  
metaData.date_subm   = [2019 03 25];                      
metaData.email       = {'bas.kooijman@vu.nl'};      
metaData.address     = {'VU University Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 25]; 

%% set data
% zero-variate data
data.ab = 15;      units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'fishbase'; 
  temp.ab = C2K(8.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on value for Clupea harengus';
data.am = 19*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(2.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 46;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase'; 
  comment.Wwb = 'based on egg diameter 1.7 mm for Clupea harengus: pi/6*0.17^3';
data.Wwi = 929;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbae';
  comment.Wwi = 'based on 0.00676*Li^3.09, see F1';
  
data.Ri = 134e3/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(2.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
ttL = [ % age range (d), length (cm)
     62  71  7.78
     72  81  6.57
     82  92 11.17
     93 102 10.28
    103 112 10.58
    113 123 11.07
    124 133 11.92
    134 143 12.14
    144 153 13.4
    154 163 12.70
    164 173 10.62
    174 184 10.63
    205 214 13.26
    215 224 13.41];
data.tL = [sum(ttL(:,1:2),2)/2, ttL(:,3)];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(2.8); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Cher2017';
   comment.tL = 'temp in C is assumed to vary between 0 and 16 C as: 8+8*sin((t + 150)/365*2*pi)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in C for tL data is assumed to behave as: 12+8*sin((t + 150)/365*2*pi) ';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCTM'; % Cat of Life
metaData.links.id_ITIS = '161723'; % ITIS
metaData.links.id_EoL = '1156440'; % Ency of Life
metaData.links.id_Wiki = 'Clupea_pallasii'; % Wikipedia
metaData.links.id_ADW = 'Clupea_pallasii'; % ADW
metaData.links.id_Taxo = '42637'; % Taxonomicon
metaData.links.id_WoRMS = '151159'; % WoRMS
metaData.links.id_fishbase = 'Clupea-pallasii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupea_pallasii}}';  
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
bibkey = 'Cher2017'; type = 'Article'; bib = [ ...  
'author = {L. A. Chernoivanova}, ' ...
'year = {2017}, ' ...
'title = {Growth of Young {P}acific Herring \emph{Clupea pallasii} of {P}eter the {G}reat {B}ay ({S}ea of {J}apan)}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, '...
'pages = {372-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Clupea-pallasii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  