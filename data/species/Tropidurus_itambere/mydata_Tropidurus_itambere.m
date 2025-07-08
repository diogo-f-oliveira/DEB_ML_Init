function [data, auxData, metaData, txtData, weights] = mydata_Tropidurus_itambere
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Tropiduridae';
metaData.species    = 'Tropidurus_itambere'; 
metaData.species_en = 'Saxicolous lizard'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.tp = 170;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Sluy1998';   
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 132;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Sluy1998';   
  temp.tpm = C2K(28); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.85;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'Sluy1998';  
data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Sluy1998';  
data.Lpm  = 5.6;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'Sluy1998';
data.Li  = 7.95;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Sluy1998';  
data.Lim  = 9.35;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Sluy1998';  

data.Wwi = 17.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Basiliscus_basiliscus: 416.5*(7.95/22.8)^3';
data.Wwim = 28.7;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Basiliscus_basiliscus: 416.5*(9.35/22.8)^3';

data.Ri  = 40/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.6';

% univariate data
% time - length
data.tL_f = [ ... % age (d),  SVL (cm)
6.265	2.979
41.763	3.868
41.763	3.628
52.204	3.998
73.086	4.314
89.791	4.684
98.144	4.463
144.084	5.168
154.524	5.002
187.935	5.448
206.729	5.505
231.787	6.319
273.550	6.765
294.432	6.637
329.930	6.879
334.107	7.064
354.988	7.029
411.369	7.272
476.102	7.627
492.807	7.296
597.216	7.746];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sluy1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (d),  SVL (cm)
6.265	2.961
29.234	3.794
58.469	4.646
106.497	5.905
181.671	6.131
198.376	7.610
229.698	7.058
233.875	7.391
271.462	7.781
290.255	7.985
319.490	7.802
616.009	9.096];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sluy1998';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '59CN2'; % Cat of Life
metaData.links.id_ITIS = '1056046'; % ITIS
metaData.links.id_EoL = '790368'; % Ency of Life
metaData.links.id_Wiki = 'Tropidurus'; % Wikipedia
metaData.links.id_ADW = 'Tropidurus_itambere'; % ADW
metaData.links.id_Taxo = '644047'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Tropidurus&species=itambere'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tropidurus}}';
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
bibkey = 'Sluy1998'; type = 'Article'; bib = [ ... 
'author = {Monique van Sluys}, ' ... 
'year = {1998}, ' ...
'title = {Growth and Body Condition of the Saxicolous Lizard \emph{Tropidurus itambere} in Southeastern {B}razil}, ' ...
'pages = {359-365}, ' ...
'volume = {32(3)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
