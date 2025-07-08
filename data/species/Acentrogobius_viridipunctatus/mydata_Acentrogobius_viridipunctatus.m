function [data, auxData, metaData, txtData, weights] = mydata_Acentrogobius_viridipunctatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Acentrogobius_viridipunctatus'; 
metaData.species_en = 'Spotted green goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 25];

%% set data
% zero-variate data

data.ab = 16;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4.5*365;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 16.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0023; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.48 mm of Acentrogobius_pflaumii: pi/6*0.048^3';
data.Wwp = 9;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.10, see F1';
data.Wwi = 59.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.10, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acentrogobius_pflaumii';
 
% uni-variate data
% time-length
data.tL_TVST = [ ... % time (yr), total length (cm)
90.471	5.849
119.804	5.801
182.476	7.260
213.500	7.154
308.342	9.026
365+90.621	10.109
365+121.680	10.982
365+152.702	10.819
365+183.736	11.001
365+215.336	11.241
730+30.896	12.219
730+92.415	12.987];
data.tL_TVST(:,1) = 100+data.tL_TVST(:,1); % convert yr to d
units.tL_TVST  = {'d', 'cm'};  label.tL_TVST = {'time', 'total length', 'Tra Vinh-Soc Trang'};  
temp.tL_TVST   = C2K(28.2);  units.temp.tL_TVST = 'K'; label.temp.tL_TVST = 'temperature';
bibkey.tL_TVST = 'DinhNguy2022'; comment.tL_TVST = 'Data from Tra Vinh-Soc Trang';
%
data.tL_BLCM = [ ... % time (yr), total length (cm)
214.938	6.982
308.022	10.004
337.357	10.186
365+29.900	11.413
365+58.671	11.940
365+90.263	12.065
730+120.162	14.146];
data.tL_BLCM(:,1) = 100+data.tL_BLCM(:,1); % convert yr to d
units.tL_BLCM  = {'d', 'cm'};  label.tL_BLCM = {'time', 'total length', 'Bac Lieu-Ca Mau'};  
temp.tL_BLCM   = C2K(28.2);  units.temp.tL_BLCM = 'K'; label.temp.tL_BLCM = 'temperature';
bibkey.tL_BLCM = 'DinhNguy2022';  comment.tL_BLCM = 'Data from Bac Lieu-Ca Mau';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_TVST = 5 * weights.tL_TVST;
weights.tL_BLCM = 5 * weights.tL_BLCM;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_TVST','tL_BLCM'}; subtitle1 = {'Data from TVST, BLCM'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '943Y'; % Cat of Life
metaData.links.id_ITIS = '172106'; % ITIS
metaData.links.id_EoL = '46575898'; % Ency of Life
metaData.links.id_Wiki = 'Acentrogobius_viridipunctatus'; % Wikipedia
metaData.links.id_ADW = 'Acentrogobius_viridipunctatus'; % ADW
metaData.links.id_Taxo = '160008'; % Taxonomicon
metaData.links.id_WoRMS = '219369'; % WoRMS
metaData.links.id_fishbase = 'Acentrogobius-viridipunctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acentrogobius_viridipunctatus}}';
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
bibkey = 'DinhNguy2022'; type = 'phdthesis'; bib = [ ...
'doi = {10.1016/j.heliyon.2022.e11759}, ' ...
'author = {Dinh, Q.M. and T.H.D. Nguyen and N.T. Truong and T.T.K. Nguyen}, ' ... 
'year = {2022}, ' ...
'title = {Population dynamics of \emph{Acentrogobius viridipunctatus} ({A}ctinopteri: {G}obiidae) in the {V}ietnamese {M}ekong {D}elta}, ' ...
'jurnal = {Heliyon}, ' ...
'volume = {8(11)}, ' ...
'pages = {e11759}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acentrogobius-viridipunctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


