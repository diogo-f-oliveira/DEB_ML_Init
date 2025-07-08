function [data, auxData, metaData, txtData, weights] = mydata_Hyporthodus_octofasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Hyporthodus_octofasciatus'; 
metaData.species_en = 'Eightbar grouper';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPSW', 'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 20]; 

%% set data
% zero-variate data

data.am = 70 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'WakeWill2015';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 56;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WakeWill2015'; 
data.Li  = 174;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'WakeWill2015';
  comment.Li = 'for Pacific populations; Indian populations reach 151 cm';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 89.4e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.04, see F2';

data.GSI  = 0.025;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'WakeNewm2013';   
  temp.GSI = C2K(16);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
4.672	33.910
5.862	29.412
6.881	44.291
8.665	55.363
8.835	68.166
10.789	49.481
10.789	71.972
11.723	82.007
11.808	59.862
11.978	69.550
14.782	85.467
14.782	95.156
15.801	81.315
15.971	73.702
20.728	94.810
20.813	121.453
21.663	113.841
23.786	120.069
23.871	87.889
42.051	130.450
44.090	173.356
64.053	174.740];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WakeWill2015';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Females change sex at 102.2 cm total length';
metaData.bibkey.F1 = 'WakeWill2015'; 
F2 = 'length-weight: Ww in g = 0.01380*(TL in cm)^3.04';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3NYHM'; % Cat of Life
metaData.links.id_ITIS = '551081'; % ITIS
metaData.links.id_EoL = '46579820'; % Ency of Life
metaData.links.id_Wiki = 'Hyporthodus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_octofasciatus'; % ADW
metaData.links.id_Taxo = '1683155'; % Taxonomicon
metaData.links.id_WoRMS = '475079'; % WoRMS
metaData.links.id_fishbase = 'Hyporthodus-octofasciatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporthodus}}';
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
bibkey = 'WakeWill2015'; type = 'Article'; bib = [ ... 
'author = {Corey B. Wakefield and Ashley J. Williams and Stephen J. Newman and Melanie Bunel and Dion K. Boddington and Elodie Vourey and David V. Fairclough}, ' ... 
'year = {2015}, ' ...
'title = {Variations in growth, longevity and natural mortality for the protogynous hermaphroditic eightbar grouper \emph{Hyporthodus octofasciatus} between the {I}ndian and {P}acific Oceans}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {172}, ' ...
'pages = {26-33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WakeNewm2013'; type = 'Article'; bib = [ ... 
'doi = {10.1093/icesjms/fst020}, ' ...
'author = {Corey B. Wakefield and Stephen J. Newman and Ross J. Marriott and Dion K. Boddington and David V. Fairclough}, ' ... 
'year = {2013}, ' ...
'title = {Contrasting life history characteristics of the eightbar grouper \emph{Hyporthodus octofasciatus} ({P}isces: {E}pinephelidae) over a large latitudinal range reveals spawning omission at higher latitudes}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {70}, ' ...
'pages = {485-497}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hyporthodus-octofasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

