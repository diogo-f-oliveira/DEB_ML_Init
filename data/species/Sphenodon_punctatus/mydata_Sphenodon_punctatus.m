function [data, auxData, metaData, txtData, weights] = mydata_Sphenodon_punctatus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Rhynchocephalia'; 
metaData.family     = 'Sphenodontidae';
metaData.species    = 'Sphenodon_punctatus'; 
metaData.species_en = 'Tuatara'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod   = {'Bas Kooijman'};    
metaData.date_mod = [2015 09 14];              
metaData.email_mod    = {'bas.kooijman@vu.nl'};            
metaData.address_mod  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];


%% set data
% zero-variate data

data.ab = 13.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 12-15 months';
data.ap = 15*365;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'Wiki';
  temp.ap = C2K(8.2); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'wiki: 10-20 yr';
data.am = 100*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(8.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 10.5;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'NelsThom2004';  
data.Li  = 45;        units.Li  = 'cm';  label.Li  = 'ultimate total length of females'; bibkey.Li  = 'Wiki';
data.Lim = 80;        units.Lim  = 'cm'; label.Lim  = 'ultimate total length of males';  bibkey.Lim  = 'Wiki';

data.Wwb = (10.5/80)^3*1300; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from (Lb/Li)^3 * Wwi';
data.Wwim = 1300;      units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'Wiki';

data.Ri  = 18/4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(8.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: eggs every 4 yr';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
0       10.555
30.922	11.387
61.375	12.173
91.828	12.960
122.281	13.769
152.266	14.208
183.656	15.410
214.109	15.850
244.562	16.150
274.547	16.358
305.469	16.659]; % cm, physical length at f and T
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NelsThom2004';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = ['Males are larger; temp 28C is lethal, active till 5C. Optimal 16-21C; ' ...
      'prob on male or female is 0.5 at 21 C; >22C gives males'];
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4YVHH'; % Cat of Life
metaData.links.id_ITIS = '202132'; % ITIS
metaData.links.id_EoL = '460890'; % Ency of Life
metaData.links.id_Wiki = 'Sphenodon_punctatus'; % Wikipedia
metaData.links.id_ADW = 'Sphenodon_punctatus'; % ADW
metaData.links.id_Taxo = '48794'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sphenodon&species=punctatus'; % ReptileDB
metaData.links.id_AnAge = 'Sphenodon_punctatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphenodon_punctatus}}';
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
bibkey = 'NelsThom2004'; type = 'Article'; bib = [ ... 
'author = {N. J. Nelson and M. B. Thompson and S. Pledger and S. N. Keall and C. H. Daugherty}, ' ... 
'year = {2004}, ' ...
'title = {Egg mass determines hatchling size, and incubation temperature influences post-hatching growth, of tuatara \emph{Sphenodon punctatus}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {263}, ' ...
'pages = {77-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sphenodon_punctatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Sphenodon_punctatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

