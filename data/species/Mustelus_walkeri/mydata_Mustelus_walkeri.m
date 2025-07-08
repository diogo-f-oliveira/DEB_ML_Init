function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_walkeri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_walkeri'; 
metaData.species_en = 'Eastern spotted gummy shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 08]; 

%% set data
% zero-variate data;
data.ab = 1.6*365;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'Rigb2015';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 26.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Rigb2015';
data.Lp  = 84;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Rigb2015';
  comment.Lpm = 'based on tp = 10-14 yr and tL_f data';
data.Lpm  = 66;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Rigb2015';
  comment.Lpm = 'based on tp = 7-10 yr and tL_m data';
data.Li  = 111.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
 
data.Wwi = 6.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00240*Li^3.13, see F1';

data.Ri  = 6/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Rigb2015';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-7 pups per litter, 1 litter per 2 yrs assumed, in view of ab';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.113	26.344
2.094	45.287
3.028	47.647
3.934	56.066
4.047	52.340
4.953	56.331
4.981	52.136
5.009	57.731
5.943	64.987
5.972	62.423
9.057	79.069
9.991	83.994
13.953	102.065
16.019	105.859];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Rigb2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.085	26.576
1.981	40.854
2.009	43.885
3.113	45.551
3.962	54.669
3.991	49.774
3.991	47.910
4.981	54.933
7.104	66.654
9.028	80.933];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Rigb2015';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00240  * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44R3D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560009'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_walkeri'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_walkeri'; % ADW
metaData.links.id_Taxo = '1683982'; % Taxonomicon
metaData.links.id_WoRMS = '398261'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-walkeri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_walkeri}}';   
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
bibkey = 'Rigb2015'; type = 'phdthesis'; bib = [ ...  
'author = {Rigby, Cassandra Louise}, ' ...
'year = {2015}, ' ...
'title  = {Life history of deepwater chondrichthyans}, ' ...
'school = {James Cook University}, ' ...
'howpublished = {\url{http://researchonline.jcu.edu.au/46298/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-walkeri.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];