function [data, auxData, metaData, txtData, weights] = mydata_Lineus_viridis

%% set metaData
metaData.phylum     = 'Nemertea'; 
metaData.class      = 'Anopla'; 
metaData.order      = 'Heteronemertea'; 
metaData.family     = 'Lineidae';
metaData.species    = 'Lineus_viridis'; 
metaData.species_en = 'Green bootlace'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 02]; 


%% set data
% zero-variate data

data.tj = 17;      units.tj = 'd';    label.tj = 'time since birth at settlement';  bibkey.tj = 'Wiki_nl';   
  temp.tj = C2K(15);     units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tp = 4.5*30.5;      units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'DohrBeck2012';   
  temp.tp = C2K(15);     units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'DohrBeck2012';   
  temp.am = C2K(15);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'survived at least 3 yrs in the lab';

data.Lp  = 8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'DohrBeck2012';
data.Li  = 11.4;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'DohrBeck2012';
data.Lim  = 5.1;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'DohrBeck2012';

data.Wwb = 3.3e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bart1984';
  comment.Wwb = 'based on egg diameter of 400 mum: pi/6*0.04^3';
data.Wwp = 0.076;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'DohrBeck2012';
  comment.Wwp = 'based on (8/11.4)^3*Wwi';
data.Wwi = 0.22;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of females';     bibkey.Wwi = 'DohrBeck2012';
data.Wwim = 0.035;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';     bibkey.Wwim = 'DohrBeck2012';

data.Ri  = 3.7e3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DohrBeck2012';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on decrease in wet weight before and after spawning form 254 to 132 mg: 0.122/Wwb per yr';
  
% univariate data
% time-length
data.tL = [ ... % time(d), length (cm)
213.614	5.145
243.125	6.228
274.321	7.853
303.835	8.982
334.314	9.617
364.443	9.898];
data.tL(:,1) = data.tL(:,1) - 145; % set origin at settlement
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'total length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DohrBeck2012';
comment.tL = 'read from stylized diagram';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Internal fertilization';
metaData.bibkey.F1 = 'DohrBeck2012'; 
F2 = 'Develops pilidium larvae that stay in the plankton for 2 to 4 weeks';
metaData.bibkey.F2 = 'Wiki_nl'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3V2SC'; % Cat of Life
metaData.links.id_ITIS = '204279'; % ITIS
metaData.links.id_EoL = '51887458'; % Ency of Life
metaData.links.id_Wiki = 'Lineus'; % Wikipedia
metaData.links.id_ADW = 'Lineus_viridis'; % ADW
metaData.links.id_Taxo = '114569'; % Taxonomicon
metaData.links.id_WoRMS = '122543'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lineus_viridis}}';
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
bibkey = 'DohrBeck2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-011-0266-z}, ' ...
'author = {J\"{o}rn von D\"{o}hren and Patrick Beckers and Thomas Bartolomaeus}, ' ... 
'year = {2012}, ' ...
'title = {Life history of \emph{Lineus viridis} ({M}\"{u}ller, 1774) ({H}eteronemertea, {N}emertea)}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {66}, ' ...
'pages = {243-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bart1984'; type = 'Article'; bib = [ ... 
'author = {Th. Bartolomaeus}, ' ... 
'year = {1984}, ' ...
'title = {Zur {F}ortpflanzungsbiologie von \emph{Lineus viridis} ({N}emertini)}, ' ...
'journal = {Helgol\"{a}nder Meeresunters.}, ' ...
'volume = {38}, ' ...
'pages = {185-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Snoerwormen}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
