  function [data, auxData, metaData, txtData, weights] = mydata_Hydrocynus_vittatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Hydrocynus_vittatus'; 
metaData.species_en = 'African tigerfish'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 05 13];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1     = [2017 11 11];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_2    = {'Bas Kooijman'};    
metaData.date_mod_2      = [2024 10 09];              
metaData.email_mod_2     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 09];


%% set data
% zero-variate data
data.ah = 22.5/24;units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = 'SteyGagi1996'; 
  temp.ah = C2K(28); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = data.ah + 4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'SteyGagi1996'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = data.ah + 17;     units.aj = 'd';    label.aj = 'age at metam'; bibkey.aj = 'SteyGagi1996'; 
  temp.aj = C2K(28); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 975; units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'guess';
  temp.ap = C2K(28); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'guessed from other age-length data, given Lp';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.065;  units.L0 = 'cm';   label.L0 = 'egg diameter';           bibkey.L0 = 'SteyGagi1996';
data.Lh = 0.29;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'SteyGagi1996';
data.Lb = 0.45;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'SteyGagi1996';
data.L13 = 0.8;   units.L13 = 'cm';  label.L13 = 'total length at 13 d since hatch'; bibkey.L13 = 'SteyGagi1996';
  temp.L13 = C2K(28); units.temp.L13 = 'K'; label.temp.L13 = 'temperature';
data.Lj = 1;      units.Lj = 'cm';   label.Lj = 'total length at metam';  bibkey.Lj = 'SteyGagi1996';
data.L40 = 4;     units.L40 = 'cm';  label.L40 = 'total length at 40 d since hatch'; bibkey.L40 = 'SteyGagi1996';
  temp.L40 = C2K(28); units.temp.L40 = 'K'; label.temp.L40 = 'temperature';
data.L72 = 5;     units.L72 = 'cm';  label.L72 = 'total length at 72 d since hatch'; bibkey.L72 = 'SteyGagi1996';
  temp.L72 = C2K(28); units.temp.L72 = 'K'; label.temp.L72 = 'temperature';
data.Lp = 39.8;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 105;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwi = 28000;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 342000/365; units.Ri = '#/d'; label.Ri = 'reprod rate at Ww = 1.7 kg'; bibkey.Ri = 'SteyGagi1996';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
103.421	6.824
132.919	7.059
165.045	9.176
196.747	8.941
226.678	10.118
288.312	11.059
365+104.224	17.412
365+134.166	17.176
365+164.085	20.000
365+195.791	19.294
365+227.044	20.235
365+288.246	20.000
720+105.041	26.118
720+134.525	28.235
720+195.285	28.235
720+226.980	28.941
1095+164.416	34.824
1095+288.574	35.294];
data.tL(:,1) = data.tL(:,1) + 20; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: tL data added';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Does not tolerate cold temperatures';
metaData.bibkey.F1    = 'SteyGagi1996';
F2 = 'Very small eggs';
metaData.bibkey.F2    = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3N6VP'; % Cat of Life
metaData.links.id_ITIS = '639847'; % ITIS
metaData.links.id_EoL = '206410'; % Ency of Life
metaData.links.id_Wiki = 'Hydrocynus_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Hydrocynus_vittatus'; % ADW
metaData.links.id_Taxo = '176952'; % Taxonomicon
metaData.links.id_WoRMS = '1054265'; % WoRMS
metaData.links.id_fishbase = 'Hydrocynus-vittatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hydrocynus_vittatus}}';  
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
bibkey = 'SteyGagi1996'; type = 'Article'; bib = [ ...    
'author = {G. J. Steyn and C. L. Gagiano and A. R. Deacon and H. H. du Preez}, ' ...
'year  = {1996}, ' ...
'title = {Notes on the induced reproduction and development of the tigerfish, \emph{Hydrocynus vittatus} ({C}haracidae), embryos and larvae}, ' ...  
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {47}, ' ...
'pages = {387-398}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4479}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

