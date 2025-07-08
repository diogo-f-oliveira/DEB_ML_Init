function [data, auxData, metaData, txtData, weights] = mydata_Phymaturus_spurcus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Liolaemidae';
metaData.species    = 'Phymaturus_spurcus'; 
metaData.species_en = 'Climber lizard'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 07];              
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

data.tp = 7*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'CabeBore2015';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 6*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'CabeBore2015';   
  temp.tpm = C2K(21); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CabeBore2015';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess';  
data.Lp  = 8.3;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'CabeBore2015';  
data.Lpm  = 7.9;  units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'CabeBore2015';
data.Li  = 8.98;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'CabeBore2015';  
data.Lim  = 8.69; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'CabeBore2015';  

data.Wwi = 25.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Basiliscus_basiliscus: 416.5*(8.98/22.8)^3';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'PianIbar2006';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per clutch, 1 clutch each 2 yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr),  SVL (cm)
 0.064	5.099
 0.081	4.175
 0.082	4.707
 0.431	4.497
 0.704	4.917
 1.755	5.966
 3.075	6.188
 3.076	6.636
 3.853	6.915
 5.115	7.250
 7.738	8.563
 8.766	8.324
10.105	8.379
10.105	8.533
10.765	8.644
11.697	8.755
11.697	8.923
12.123	8.418
12.143	8.950
12.822	8.922];
data.tL_f(:,1) = 365 * (data.tL_f(:,1)+0.8);
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CabeBore2015';
%
data.tL_m = [ ... % time since birth (yr),  SVL (cm)
 6.825	8.284
 8.047	8.199
 8.105	8.087
 8.163	8.003
 8.688	8.492
 9.134	8.338
 9.717	8.463
 9.813	8.225
10.065	8.225
10.142	7.917
10.724	7.972
10.765	8.532
11.152	8.181
11.774	8.671
11.792	8.069];
data.tL_m(:,1) = 365 * (data.tL_m(:,1)+0.8);
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CabeBore2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 10 * weights.Lb;

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
D2 = 'Temperatures are guessed; temp for tL_data varies seasonally -5 C till 27 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Viviparous; males and females similar in size and growth, herbivorous';
metaData.bibkey.F1 = 'PianIbar2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '77H34'; % Cat of Life
metaData.links.id_ITIS = '1056571'; % ITIS
metaData.links.id_EoL = '784266'; % Ency of Life
metaData.links.id_Wiki = 'Phymaturus_spurcus'; % Wikipedia
metaData.links.id_ADW = 'Phymaturus_spurcus'; % ADW
metaData.links.id_Taxo = '3816409'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Phymaturus&species=spurcus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phymaturus_spurcus}}';
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
bibkey = 'CabeBore2015'; type = 'Article'; bib = [ ... 
'author = {Facundo Cabezas-Cartes and Jorgelina M. Boretto and Nora R. Ibargüengoyt\''{i}a}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth and life-history parameters of an endemic vulnerable lizard from {P}atagonia, {A}rgentina}, ' ...
'pages = {215-224}, ' ...
'volume = {25}, ' ...
'journal = {Herpetological Journal}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
